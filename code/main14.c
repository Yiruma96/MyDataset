// 关于通过fixed或是advise两种方式，以原子操作清理内存的实验验证

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <sys/mman.h>
#include <stdbool.h>
#include <errno.h>


// 实验结果表明，已经使用过的内存，使用fixed强制重新申请，确实可以减少其RSS占用
void test_fixed_for_reuse(){
    uint64_t map_count = 0;
//    uint64_t map_addr = 0x0000000100000000;
    uint64_t map_length = 4096*1024*20;

    void *mem = mmap(NULL, map_length, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    if (mem == MAP_FAILED) {
        printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }
    else{
        printf("10s后重置内存值\n");
        usleep(10000000);
    }
    memset(mem, 1, map_length);

    printf("10s开始重新申请");
    usleep(10000000);
    for(uint64_t i=(uint64_t)mem; i<(uint64_t)mem+map_length; i+=4096){
        void* submem = mmap((void*)i, 4096, PROT_READ | PROT_WRITE, 0b110010, -1, 0);
        if (submem == MAP_FAILED) {
            printf("子内存分配失败，错误码%d %s\n", errno, strerror(errno));
            exit(1);
        }
        usleep(10000);
    }
}


// 使用madvise+MADV_DONTNEED释放内存，然后重新使用，实验结果表明不会发生段错误
// ChatGPT: madvise 和 MADV_DONTNEED 告诉内核指定内存区域不再需要，内核会将这些页面标记为不需要，并释放物理内存, 但PTE条目仍然保留在进程的虚拟地址空间中
// ChatGPT: 再次访问这些页面会导致内核重新分配物理内存页面，并初始化为零。
// ChatGPT: madvise + MADV_DONTNEED 的调用通常比较快，因为它只是更新内核的内存管理数据结构，而不是修改进程的虚拟地址空间。
void test_advise_for_reuse(){
    // 申请
    uint64_t map_length = 4096*10240;
    void *map_addr = mmap(NULL, map_length, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    if (map_addr == MAP_FAILED) {
        printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("申请的内存位于0x%lx\n", (uint64_t)map_addr);
    }
    memset(map_addr, 1, map_length);

    printf("10s后释放内存值\n");
    usleep(10000000);

    // 释放
    if (madvise(map_addr, map_length, MADV_DONTNEED) != 0) {
        perror("madvise failed");
    }else{
        printf("将0x%lx的内存标记为不使用\n", (uint64_t)map_addr);
    }

    printf("等待10s，请观察RSS是否降低\n");
    usleep(10000000);

    // 再次使用
    printf("重新写这段内存，观察是否报错\n");
    memset(map_addr, 1, map_length);
    usleep(10000000);
}

// 使用unmap释放内存，然后重新使用，实验结果表明会发生段错误
// ChatGPT: munmap 释放内存并解除内存映射，完全移除进程的虚拟地址空间中的指定范围。
// ChatGPT: munmap 可能比 madvise + MADV_DONTNEED 稍慢，因为它涉及更复杂的操作，包括解除映射和更新虚拟内存管理数据结构。
// ChatGPT: 避免进程意外访问已释放的内存区域，从而提高安全性。
void test_unmap_for_reuse(){
    // 申请
    uint64_t map_length = 4096*10240;
    void *map_addr = mmap(NULL, map_length, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    if (map_addr == MAP_FAILED) {
        printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("申请的内存位于0x%lx\n", (uint64_t)map_addr);
    }
    memset(map_addr, 1, map_length);

    printf("10s后释放内存值\n");
    usleep(10000000);

    // 释放
    int status = munmap((void*)map_addr, map_length);
    if (status == -1){
        printf("内存释放失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("释放内存0x%lx\n", (uint64_t)map_addr);
    }

    printf("等待10s，请观察RSS是否降低\n");
    usleep(10000000);

    // 再次使用
    printf("重新写这段内存，观察是否报错\n");
    memset(map_addr, 1, map_length);
    usleep(10000000);
}


// 实验结果表明，在正常使用unmap释放内存后，随即的mmap确实倾向于使用这一段内存。即便是我们加上advise标记后，这段内存仍然会被复用
void test_advise(){
    // 申请
    uint64_t map_length = 4096*10;
    void *map_addr = mmap(NULL, map_length, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    if (map_addr == MAP_FAILED) {
        printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("申请的内存位于0x%lx\n", (uint64_t)map_addr);
    }
    memset(map_addr, 1, map_length);

    // 释放前添加advise标记
    if (madvise(map_addr, map_length, MADV_DONTNEED) != 0) {
        perror("madvise failed");
    }else{
        printf("将0x%lx的内存标记为不使用\n", (uint64_t)map_addr);
    }

    // 释放
    int status = munmap((void*)map_addr, map_length);
    if (status == -1){
        printf("内存释放失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("释放内存0x%lx\n", (uint64_t)map_addr);
    }

    // 随即重新申请
    void *map_addr2 = mmap(NULL, map_length, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    if (map_addr2 == MAP_FAILED) {
        printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
        exit(1);
    }else{
        printf("重新申请的内存位于0x%lx\n", (uint64_t)map_addr2);
    }
    memset(map_addr2, 1, map_length);
}


int main(){
    printf("pid: %d\n", getpid());

//    test_fixed_for_reuse();
    test_advise_for_reuse();
//    test_unmap_for_reuse();

    return 0;
}