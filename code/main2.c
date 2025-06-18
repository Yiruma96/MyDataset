// 关于TBI指针标记的实验验证

// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -O0 -o main2 main2.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=address -O0 -o main2 main2.c
//
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -g -O0 -o main2 main2.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu -fsanitize=address -g -O0 -o main2 main2.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -g -O0 -o main2 main2.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -g -O0 -o main2 main2.c
#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>

#define WIDTH 16
void hex_dump(const void *ptr, size_t size) {
    const unsigned char *buf = (const unsigned char *)ptr;
    size_t i, j;

    for (i = 0; i < size; i += WIDTH) {
        printf("%08lx: ", (unsigned long)i);

        for (j = 0; j < WIDTH && (i + j) < size; j++) {
            printf("%02x ", buf[i + j]);
        }

        for (; j < WIDTH; j++) {
            printf("   ");
        }

        for (j = 0; j < WIDTH && (i + j) < size; j++) {
            unsigned char ch = buf[i + j];
            if (ch >= ' ' && ch <= '~') {
                printf("%c", ch);
            } else {
                printf(".");
            }
        }

        printf("\n");
    }
}

int main(int argc, char** argv) {
    pid_t current_pid = getpid();
    printf("The process ID (PID) is: %d\n", current_pid);

    char* data = (char*) malloc(30);
    data[0] = 'a';
    data[1] = 'b';
    printf("data=0x%016lx, first_ele=%c remove tag=0x%lx tag=%p\n", (uint64_t)data, data[0], (uint64_t)data&0x00ffffffffffffff, ((uint64_t)data>>56)&0xff);

    char* data1 = (char*) malloc(30);
    data1[0] = 'a';
    data1[1] = 'b';
    data[50] = 'c';
    printf("data1=0x%016lx, first_ele=%c remove tag=0x%lx tag=%p\n", (uint64_t)data1, data1[0], (uint64_t)data1&0x00ffffffffffffff, ((uint64_t)data1>>56)&0xff);

    // hex_dump((void*)(0x200efff00000000+0xefdeffff000), 2);


    // for (int i=0; i<10; i++){
    //   int* data = (int*) malloc(0x20);
    //   data[0] = 0x233;
    //   int first_ele = data[0];
    //   printf("data%d=0x%016lx, first_ele=%lx remove tag=0x%lx tag=%p\n", i, (uint64_t)data, data[0], (uint64_t)data&0x00ffffffffffffff, ((uint64_t)data>>56)&0xff);
    // }
    //
    getchar();
    return 0;
}