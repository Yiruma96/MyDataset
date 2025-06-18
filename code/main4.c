// 关于布隆过滤器的实验验证

// xie. ========================布隆过滤器的定义 start========================

#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>
#include <stdbool.h>

#define BIG_CONSTANT(x) (x##LLU)

// 布隆过滤器
typedef struct __bloomfilter {
    // 哈希函数随机数种子
    uint64_t seeds[3];
    // 位数组
    uint8_t bits[4096];
} bloomfilter_t;



// Murmurhash264A
// @Reference:
// https://github.com/aappleby/smhasher/blob/master/src/MurmurHash2.cpp
uint64_t murmurhash(const void *key, int len, uint64_t seed) {
    const uint64_t m = BIG_CONSTANT(0xc6a4a7935bd1e995);
    const int r = 47;

    uint64_t h = seed ^ (len * m);

    const uint64_t *data = (const uint64_t *)key;
    const uint64_t *end = data + (len / 8);

    while (data != end) {
        uint64_t k = *data++;

        k *= m;

        k ^= k >> r;
        k *= m;

        h ^= k;
        h *= m;
    }

    const unsigned char *data2 = (const unsigned char *)data;

    switch (len & 7) {
        case 7:
            h ^= (uint64_t)data2[6] << 48;
        case 6:
            h ^= (uint64_t)data2[5] << 40;
        case 5:
            h ^= (uint64_t)data2[4] << 32;
        case 4:
            h ^= (uint64_t)data2[3] << 24;
        case 3:
            h ^= (uint64_t)data2[2] << 16;
        case 2:
            h ^= (uint64_t)data2[1] << 8;
        case 1:
            h ^= (uint64_t)data2[0];
            h *= m;
    };

    h ^= h >> r;
    h *= m;
    h ^= h >> r;

    return h;
}

uint64_t generate_random_u64() {
    uint64_t num = 0;
    for (int i = 0; i < sizeof(uint64_t); i += sizeof(uint32_t)) {
        num = (num << (8 * sizeof(uint32_t))) |
              (rand() & 0xFFFFFFFF);
    }
    return num;
}

// 置位方法
void set_bloomfilter(bloomfilter_t* bloomfilter, const void *key, int len) {
    int i;
    for (i = 0; i < 3; i++) {
        uint64_t hashcode = murmurhash(key, len, bloomfilter->seeds[i]);
        uint64_t n = hashcode % 32768;  // hashcode对数组长度(4096*8)取余
        printf("set hash code=0x%lx n=%d bits[%d] |= %d tail=%d\n", hashcode, n, n>>3, 1 << (n & 0x7), n & 0x7);
        printf("bloomfilter.bits[n>>3] = %d\n", bloomfilter->bits[n >> 3]);
        bloomfilter->bits[n >> 3] |= 1 << (n & 0x7);  // n>>3计算出在哪一个Byte，n&0x7计算出是Byte内部的哪一位
        printf("bloomfilter.bits[n>>3] = %d\n", bloomfilter->bits[n >> 3]);
    }
}

// 测试否置位
bool test_bloomfilter(bloomfilter_t* bloomfilter, void *key, int len) {
    bool ok = true;
    for (int i = 0; i < 3; i++) {
        uint64_t hashcode = murmurhash(key, len, bloomfilter->seeds[i]);
        uint64_t n = hashcode % 32768;  // hashcode对数组长度(4096*8)取余
        printf("test hash code=0x%lx bits[%d] = %zd?\n", hashcode, n>>3, bloomfilter->bits[n >> 3]);
        if (!(bloomfilter->bits[n >> 3] & (1 << (n & 0x7)))) {  // n>>3计算出在哪一个Byte，n&0x7计算出是Byte内部的哪一位
            ok = false;
        }
    }
    return ok;
}

// 初始化布隆过滤器
void init_bloomfilter(bloomfilter_t* bloomfilter) {
    // 哈希函数加盐所需seed采用数组元素指针（确保唯一）
    for (int i = 0; i < 3; i++) {
        bloomfilter->seeds[i] = generate_random_u64();
    }
    // 初始化bits
    memset(bloomfilter->bits, 0, 4096);
    printf("init bloomfilter=%p\n", &bloomfilter);
    return;
}

// xie. ========================布隆过滤器的定义 end========================


int main(int argc, char** argv){
    bloomfilter_t bloomfilter;
    init_bloomfilter(&bloomfilter);

    // 批量设置数据
//    int i;
//    for(i=1; i<10; i+=2) {
//        set_bloomfilter(bloomfilter, (void *)&i, sizeof(int));
//    }
//    // 检测是否全部命中布隆过滤器
//    int ok;
//    for(i=1; i<10; i++) {
//        ok = test_bloomfilter(bloomfilter, (void *)&i, sizeof(int));
//        printf("%d\n", ok);
//    }

    printf("bloomfilter=%p\n", &bloomfilter);
    int a = 0;
    int b = 0;

//    char* a = malloc(10);
//    char* b = malloc(10);
    set_bloomfilter(&bloomfilter, &a, 4);
    bool retu = test_bloomfilter(&bloomfilter, &a, 4);
    printf("Retu=%ld\n", retu);
}