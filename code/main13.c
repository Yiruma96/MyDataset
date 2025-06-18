// 关于内核对单进程映射数量的限制实验

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <sys/mman.h>
#include <stdbool.h>
#include <errno.h>

/* https://bbs.csdn.net/topics/392501189 google搜索“munmap返回错误码12”，该链接给出了关键原因，在于内核配置选项vm.max_map_count会限制单个进程中的最大内存映射数量。而随机化带来的内存碎片化分配则会触发该上限
 * https://blog.csdn.net/anqixiang/article/details/104922680  该链接指出了修改内核参数的几个方法
 * - 查看：cat /proc/sys/vm/max_map_count
 * - 临时修改(单次系统内有效)：sysctl -w vm.max_map_count=100000
 * - 永久修改(重启后仍有效)：vim /etc/sysctl.conf 在里面加一行vm.max_map_count=xxxxx即可，然后sysctl -p生效
 * */

/* 另外实验过程中了解到了mmap和unmap系统调用的返回值：
 * 系统调用的返回值在负1至负4095通常用来表示错误码，而其他范围则返回值则可以看作正确调用
 * - ASan实现了系统调用的直接访问，所以它的internal_mmap和internal_unmap的返回值需要自己判断是错误码还是正确返回值，ASan提供了internal_iserror函数
 * - libc里面的mmap函数以及unmap函数则是进行了对系统调用的返回值进行了包装，它的返回值就是0表示正确，-1表示错误。错误时具体的错误码被放在了全局变量errno里面.
 * */

// map过多导致mmap返回12错误码
void mmap_test(){
    pid_t current_pid = getpid();
    uint64_t map_count = 0;
    uint64_t map_addr = 0x0000000100000000;

    while(true){
        printf("[PID: %d] 第#%llu块内存映射\n", current_pid, map_count);

        void *mem = mmap((void*)map_addr, 0x1000, PROT_READ | PROT_WRITE, 0b110010, -1, 0);
        if (mem == MAP_FAILED) {
            printf("内存分配失败，错误码%d %s\n", errno, strerror(errno));
            exit(1);
        }

        map_addr += 0x2000;
        map_count += 1;
//        usleep(1000000);
    }
}

// map过多导致munmap返回12错误码(释放导致一个大块分裂为两个小块同样会导致map过多)
void munmap_test(){
    pid_t current_pid = getpid();
    uint64_t map_count = 0;
    uint64_t map_addr = 0x0000000100000000;
    mmap((void*)map_addr, map_addr*0x10, PROT_READ | PROT_WRITE, 0b110010, -1, 0);

    while(true){
        printf("[PID: %d] 第#%llu块内存释放\n", current_pid, map_count);

        int status = munmap((void*)map_addr, 0x1000);
        if (status == -1){
            printf("内存释放失败，错误码%d %s\n", errno, strerror(errno));
            exit(1);
        }

        map_addr += 0x2000;
        map_count += 1;
//        usleep(1000000);
    }
}

int main(){
    mmap_test();
//    munmap_test();
    printf("运行结束\n");
}