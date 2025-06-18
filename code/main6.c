// 关于随机内存释放分配的实验验证

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdbool.h>

#define PAGE_SIZE 4096

// 生成一个 64 位的随机数
unsigned long long generate_random_64bit(u_int64_t lower, u_int64_t upper) {
    unsigned long long rand_64bit = 0;
    do {
        rand_64bit = ((unsigned long long)random() << 32) | random();
    } while (rand_64bit < upper || rand_64bit >= lower);
    return rand_64bit;
}

bool internal_iserror(int retval, int *rverrno) {
    if (retval >= (int)-4095) {
        if (rverrno)
            *rverrno = -retval;
        return true;
    }
    return false;
}

int main() {
    pid_t current_pid = getpid();
    printf("The process ID (PID) is: %d\n", current_pid);

    void *mem1 = mmap((void*)0x0000001000000000, 0x100000, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
    printf("Allocate memory %p-%p\n", mem1, (mem1)+0x100000);
    if ((u_int64_t)mem1 != 0x0000001000000000){
        printf("Allocate obj1 Failed\n");
        exit(1);
    }

    int status = munmap((void*)0x1000000000000000, 0x10000);
    printf("munmap状态码%d\n", status);

//    void *mem2 = mmap((void*)0x0000001000020000, 0x10000, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
//    printf("Allocate memory %p-%p\n", mem2, (mem2)+0x10000);
////    if ((u_int64_t)mem2 != 0x0000001000020000){
////        printf("Allocate obj2 Failed\n");
////        exit(1);
////    }
//
//    void *mem3 = mmap((void*)0x0000001000020000, 0x10000, PROT_READ | PROT_WRITE, 0b100010, -1, 0);
//    printf("Allocate memory %p-%p\n", mem3, (mem3)+0x10000);





//    long count = 0;
//    while (1) {
//
//
//        char* cur_addr = mem;
//        while (1) {
//            // 生成内存写的随机目标地址
//            printf("[#%d] PID=%d Write at address: %p\n", count, current_pid, cur_addr);
//            if (cur_addr >= mem+length){
//                break;
//            }
//            cur_addr[0x10] = 'a';
//
//            // 释放
//            if (munmap(cur_addr, PAGE_SIZE) == -1) {
//                perror("munmap failed");
//                break;
//            }
//
//            // 重新申请
//            void *mem = mmap(cur_addr, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS, -1,
//                             0);
//            if (mem == MAP_FAILED) {
//                perror("mmap failed");
//                break;
//            }
//
//            count++;
//            cur_addr += PAGE_SIZE * PAGE_SIZE;
//
////            usleep(1000); // 为了让循环速度不至于过快
//        }
//    }

    return 0;
}