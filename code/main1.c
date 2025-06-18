// 关于内存分配释放下，RSS和PTE变化的实验验证

// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -fsanitize=address -O0 -o main1 main1.c
//
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu -fsanitize=hwaddress -mllvm --my-skip-sanitizer-pass -g -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu -fsanitize=address -g -O0 -o main1 main1.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -fsanitize-hwaddress-experimental-aliasing -g -O0 -o main1 main1.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -g -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu -fsanitize=hwaddress -g -O0 -o main1 main1.c
// /asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -fsanitize=hwaddress -mllvm --my-skip-sanitizer-pass -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu -g -O0 -o main1 main1.c
// clang-15 -shared-libsan -Wl,-rpath=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux -fsanitize=hwaddress -g -O0 -o main1-hwasan main1.c

#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>

int main(int argc, char** argv) {
    pid_t current_pid = getpid();
    printf("The process ID (PID) is: %d\n", current_pid);

//    int* data = (int*) malloc(0x22);
//    data[0] = 0x233;
//    int first_ele = data[0];
//    printf("data=0x%016lx, first_ele=%lx remove tag=0x%lx tag=%p\n", (uint64_t)data, data[0], (uint64_t)data&0x00ffffffffffffff, ((uint64_t)data>>56)&0xff);
//    data = (int*)((uint64_t)data & 0x0000ffffffffffff);
//    data = (int*)((uint64_t)data | 0x1100000000000000);
//    free(data);

    int count = 1;
    while (1) {
        for (int i = 0; i < 240; i++) {
            int *data = (int *) malloc(0x2e);
            data[0] = 0x233;
            int first_ele = data[0];
//            printf("data%d=0x%016lx, first_ele=%lx remove tag=0x%lx tag=%p\n", i, (uint64_t) data, data[0],
//                   (uint64_t) data & 0x00ffffffffffffff, ((uint64_t) data >> 56) & 0xff);
            free(data);
        }
        printf("[PID=%d] 第%d轮分配与释放结束\n", current_pid, count);
        usleep(100000);
        count++;
    }

    getchar();
    return 0;
}