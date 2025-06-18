#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdbool.h>

#define CHUNKS 240
#define _page_size 4096

uint64_t RoundUpTo(uint64_t size, uint64_t boundary) {
    return (size + boundary - 1) & ~(boundary - 1);
}
uint64_t RoundDownTo(uint64_t x, uint64_t boundary) {
    return x & ~(boundary - 1);
}
bool IsAligned(uint64_t a, uint64_t alignment) {
    return (a & (alignment - 1)) == 0;
}

void unmap_fragment_region(uint64_t region, uint8_t* chunk_can_unmap, uint64_t chunk_size, int min_chunk_num, uint8_t start_chunk, uint8_t end_chunk){
    // 预过滤1. 未达到最少可释放的chunk数量，其必然无法构成至少一个page
    if (end_chunk-start_chunk < min_chunk_num)
        return;
    // 预过滤2. 所有块都是部分释放块则不进行释放
    bool find_no_part_unmap = false;
    for (int j = start_chunk; j < end_chunk; j++){
        if ((chunk_can_unmap[j] & 0b100) == 0){
            find_no_part_unmap = true;
            break;
        }
    }
    if (!find_no_part_unmap)
        return;

    printf("Ready for unmapping 0x%lx-0x%lx chunk id [%d-%d]\n",
           region + (start_chunk*chunk_size),
           region + (end_chunk*chunk_size),
           start_chunk, end_chunk-1);

    // strip可以释放的chunk边界
    uint64_t unmap_beg = RoundUpTo(region + (start_chunk*chunk_size), _page_size);
    start_chunk = ((unmap_beg-region) / chunk_size); // 前有2.3个块则下标取2，前有3个块则下标取3
    uint64_t unmap_end = RoundDownTo(region + (end_chunk*chunk_size), _page_size);
    end_chunk = ((unmap_end-region) / chunk_size) - ((unmap_end-region)%chunk_size==0?1:0);  // 前有9.5个块则下标取9，前有11个块则下标取10
    if (unmap_beg >= unmap_end) // modify
        return;

    // 释放
    if (munmap((void*)unmap_beg, unmap_end-unmap_beg) == -1) {
        printf("Failed to unmap fragment region from 0x%lx-0x%lx\n", unmap_beg, unmap_end);
        exit(1);
    }

    int unmapped_num = 0;
    // 非起始块和非终止块一定是被完整释放的，标记它们的状态
    for (int i=start_chunk+1; i < end_chunk; ++i) {
        chunk_can_unmap[i] = 0;
        unmapped_num += 1;
    }
    // 起始块和终止块可能只是释放了一部分(左半边或是右半边)，所以我们要独立进行左右两半的释放检查并进行标记
    if (region+start_chunk*chunk_size >= unmap_beg)             // 检查起始块左边界
        chunk_can_unmap[start_chunk] &= 0b101;
    if (region+start_chunk*chunk_size+chunk_size <= unmap_end)  // 检查起始块右边界
        chunk_can_unmap[start_chunk] &= 0b110;
    if (region+end_chunk*chunk_size >= unmap_beg)               // 检查终止块左边界
        chunk_can_unmap[end_chunk] &= 0b101;
    if (region+end_chunk*chunk_size + chunk_size <= unmap_end)  // 检查终止块的右边界
        chunk_can_unmap[end_chunk] &= 0b110;
    // 如果边界块是部分释放的，为其添加额外的已处理标记
    if ((chunk_can_unmap[start_chunk] & 0b11) == 0){
        chunk_can_unmap[start_chunk] = 0;
        unmapped_num += 1;
    }else
        chunk_can_unmap[start_chunk] |= 0b100;
    if (start_chunk != end_chunk && (chunk_can_unmap[end_chunk] & 0b11) == 0){
        chunk_can_unmap[end_chunk] = 0;
        unmapped_num += 1;
    }else
        chunk_can_unmap[end_chunk] |= 0b100;

    printf("Unmapping 0x%lx-0x%lx chunk id %c%d-%d%c (%d chunks)\n",
           unmap_beg,
           unmap_end,
           (chunk_can_unmap[start_chunk]==0) ? '[':'(',
           start_chunk,
           end_chunk,
           (chunk_can_unmap[end_chunk]==0) ? ']':')',
           unmapped_num);
}

void scan_and_unmap(uint64_t region, uint8_t* chunk_can_unmap, uint64_t chunk_size) {
    int min_chunk_num = chunk_size >= _page_size ? 1 : (_page_size/chunk_size) + (_page_size%chunk_size==0? 0:1);

    // 打印该region中所有chunk的状态
    for (int i=0; i<240; i++){
        if (i % 8 == 0)
            printf(" [#%d]", i);

        printf("%d", chunk_can_unmap[i]);
    }
    printf("\n");

    // 开始追踪可连续释放的区域
    int start_index = -1;
    for (int i = 0; i < CHUNKS; i++) {
        if (chunk_can_unmap[i] != 0) {
            // start: 可unmap的chunk作为开头
            if (start_index == -1)
                start_index = i;
        } else {
            // end. 直到发现一个不可unmap的，作为连续区域的结尾，然后开始准备释放该区域
            if (start_index != -1 && chunk_can_unmap[i] == 0){
                // 开始尝试释放该区域
                unmap_fragment_region(region, chunk_can_unmap, chunk_size, min_chunk_num, start_index, i);
                start_index = -1;
            }
        }
    }

    // 检查是否有连续区域在数组的末尾
    if (start_index != -1) {
        // 开始尝试释放该区域
        unmap_fragment_region(region, chunk_can_unmap, chunk_size, min_chunk_num, start_index, 240);
        start_index = -1;
    }
}

//1. 测试 2. 看是否还有优化的地方
int main() {
    // 用于表示是否可以unmap的数组，每个byte对应一个chunk的状态
    uint8_t chunk_can_unmap[240];
    memset(chunk_can_unmap, 0, 240);
    int chunk_size = 2048+0x10;
//    int chunk_size = 4096;

    // 执行匿名内存映射，使用MAP_ANONYMOUS和MAP_SHARED
    char *region = mmap(NULL, chunk_size*240, PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, -1, 0);
    if (region == MAP_FAILED) {
        perror("Error mapping the memory");
        return EXIT_FAILURE;
    } else{
        printf("Mapping %p-%p\n", region, region+chunk_size*240);
    }


    for (int i = 0; i <= 239; i++) {
        chunk_can_unmap[i] = 0b11;
    }
//    for (int i = 2; i <= 3; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
    // 调用扫描函数
    printf("0th unmap:\n");
    scan_and_unmap((uint64_t)region, chunk_can_unmap, chunk_size);


//    // 模拟释放chunk 3 到 chunk 10
//    for (int i = 1; i <= 1; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    for (int i = 12; i <= 40; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    // 调用扫描函数
//    printf("\n1th unmap:\n");
    scan_and_unmap((uint64_t)region, chunk_can_unmap, chunk_size);
//
//    // 模拟41到50，其中41应该是和40联在一起的，注意看下
//    for (int i = 11; i <= 11; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    for (int i = 0; i <= 2; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    printf("\n2th unmap:\n");
//    scan_and_unmap((uint64_t)region, chunk_can_unmap, chunk_size);
//
//    for (int i = 60; i <= 80; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    printf("\n3th unmap:\n");
//    scan_and_unmap((uint64_t)region, chunk_can_unmap, chunk_size);
//
//    for (int i = 200; i <= 239; i++) {
//        chunk_can_unmap[i] = 0b11;
//    }
//    printf("4th unmap:\n");
//    scan_and_unmap((uint64_t)region, chunk_can_unmap, chunk_size);


    return 0;
}