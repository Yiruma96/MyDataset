// 关于TBI指针标记的实验验证

// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=address -O0 -o main1 main1.c
//
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -g -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu -fsanitize=address -g -O0 -o main1 main1.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -g -O0 -o main1 main1.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -g -O0 -o main1 main1.c
#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>
#include "string.h"

int main(int argc, char** argv) {
    pid_t current_pid = getpid();
    printf("The process ID (PID) is: %d\n", current_pid);
//    int* data = (int*) malloc(0x20);
//    data[0] = 0x233;
//    int first_ele = data[0];
//    printf("data=0x%016lx, first_ele=%lx remove tag=0x%lx tag=%p\n", (uint64_t)data, data[0], (uint64_t)data&0x00ffffffffffffff, ((uint64_t)data>>56)&0xff);

    uint64_t count = 0;
    while (1){
        char* data1 = (char*) malloc(0x20);
        char* data2 = (char*) malloc(0x20);
        memset(data1, '1', 0x20);
        memset(data2, '2', 0x20);

        uint8_t data1_tag = ((uint64_t)data1 >> 56) & 0xff;
        uint8_t data2_tag = ((uint64_t)data2 >> 56) & 0xff;
        uint64_t data1_untag = ((uint64_t)data1 & 0x00ffffffffffffff);
        uint64_t data2_untag = ((uint64_t)data2 & 0x00ffffffffffffff);

        printf("> count#%ld\n", count);
        printf("  data1=0x%016lx, tag=%p\n", (uint64_t)data1, data1_tag);
        printf("  data2=0x%016lx, tag=%p\n", (uint64_t)data2, data2_tag);
        printf(data1>data2 ? "  data1>data2\n" : "  data2>data1\n");

        if (data1_tag == data2_tag) {
            if (data1_untag < data2_untag){
                char overflow = data1[0x30];
                printf("access %p=%c from %p\n", data1+0x30, overflow, data1);
            }else{
                char overflow = data2[0x30];
                printf("access %p=%c from %p\n", data2+0x30, overflow, data2);
            }
            break;
        }
        else {
            free(data1);
            free(data2);
            count++;
        }
    }

    getchar();
    return 0;
}