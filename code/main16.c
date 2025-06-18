// 用于测试hwasan对stack的插桩实验

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <time.h>
#include <sys/mman.h>
#include <stdbool.h>
#include <errno.h>

/*
hwasan编译
/asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang -shared-libsan -Wl,-rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu -fsanitize=hwaddress -O0 -o main16-hwasan main16.c

/asan/ASan-LLVM/llvm/cmake-build-debug/bin/clang-15 -cc1 -triple aarch64-unknown-linux-gnu -S -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name main16.c -mrelocation-model pic -pic-level 2 -pic-is-pie -mframe-pointer=non-leaf -fmath-errno -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -funwind-tables=2 -target-cpu generic -target-feature +neon -target-feature +v8a -target-abi aapcs -fallow-half-arguments-and-returns -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -fno-dwarf-directory-asm -fcoverage-compilation-dir=/asan/code -resource-dir /asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0 -internal-isystem /asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/include -internal-isystem /usr/local/include -internal-isystem /usr/lib/gcc/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/include -internal-externc-isystem /usr/include/aarch64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -O0 -fdebug-compilation-dir=/asan/code -ferror-limit 19 -fsanitize=hwaddress -fsanitize-system-ignorelist=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/share/hwasan_ignorelist.txt -default-function-attr hwasan-abi=interceptor -target-feature +tagged-globals -fno-signed-char -fgnuc-version=4.2.1 -fcolor-diagnostics -target-feature +outline-atomics -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o main16-hwasan.s -x c main16.c
clang -c -EL -o main16.o main16.s
/usr/bin/ld -pie -EL -z relro --hash-style=gnu --eh-frame-hdr -m aarch64linux -dynamic-linker /lib/ld-linux-aarch64.so.1 -o main16 /lib/aarch64-linux-gnu/Scrt1.o /lib/aarch64-linux-gnu/crti.o /usr/lib/gcc/aarch64-linux-gnu/11/crtbeginS.o -L/usr/lib/gcc/aarch64-linux-gnu/11 -L/lib/aarch64-linux-gnu -L/usr/lib/aarch64-linux-gnu -L/lib -L/usr/lib /asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu/libclang_rt.hwasan.so --whole-archive /asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu/libclang_rt.hwasan-preinit.a --no-whole-archive -rpath=/asan/ASan-LLVM/llvm/cmake-build-debug/lib/clang/15.0.0/lib/aarch64-unknown-linux-gnu main16.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /usr/lib/gcc/aarch64-linux-gnu/11/crtendS.o /lib/aarch64-linux-gnu/crtn.o


asan编译
clang -fno-integrated-as -fsanitize=address -O0 -o main16-asan main16.c
/usr/lib/llvm-15/bin/clang -cc1 -triple aarch64-unknown-linux-gnu -S -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name main16.c -mrelocation-model pic -pic-level 2 -pic-is-pie -mframe-pointer=non-leaf -fmath-errno -ffp-contract=on -fno-rounding-math -no-integrated-as -mconstructor-aliases -funwind-tables=2 -target-cpu generic -target-feature +neon -target-feature +v8a -target-abi aapcs -fallow-half-arguments-and-returns -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -fno-dwarf-directory-asm -fcoverage-compilation-dir=/asan/code -resource-dir /usr/lib/llvm-15/lib/clang/15.0.7 -internal-isystem /usr/lib/llvm-15/lib/clang/15.0.7/include -internal-isystem /usr/local/include -internal-isystem /usr/bin/../lib/gcc/aarch64-linux-gnu/11/../../../../aarch64-linux-gnu/include -internal-externc-isystem /usr/include/aarch64-linux-gnu -internal-externc-isystem /include -internal-externc-isystem /usr/include -O0 -fdebug-compilation-dir=/asan/code -ferror-limit 19 -fsanitize=address -fsanitize-system-ignorelist=/usr/lib/llvm-15/lib/clang/15.0.7/share/asan_ignorelist.txt -fsanitize-address-use-after-scope -fno-assume-sane-operator-new -fno-signed-char -fgnuc-version=4.2.1 -fcolor-diagnostics -target-feature +outline-atomics -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o main16-asan.s -x c main16.c
clang -c -EL -o main16.o main16.s
/usr/bin/ld -pie -EL -z relro --hash-style=gnu --build-id --eh-frame-hdr -m aarch64linux -dynamic-linker /lib/ld-linux-aarch64.so.1 -o main16 /lib/aarch64-linux-gnu/Scrt1.o /lib/aarch64-linux-gnu/crti.o /usr/bin/../lib/gcc/aarch64-linux-gnu/11/crtbeginS.o -L/usr/bin/../lib/gcc/aarch64-linux-gnu/11 -L/lib/aarch64-linux-gnu -L/usr/lib/aarch64-linux-gnu -L/lib -L/usr/lib --whole-archive /usr/lib/llvm-15/lib/clang/15.0.7/lib/linux/libclang_rt.asan_static-aarch64.a --no-whole-archive --whole-archive /usr/lib/llvm-15/lib/clang/15.0.7/lib/linux/libclang_rt.asan-aarch64.a --no-whole-archive --dynamic-list=/usr/lib/llvm-15/lib/clang/15.0.7/lib/linux/libclang_rt.asan-aarch64.a.syms main16.o --no-as-needed -lpthread -lrt -lm -ldl -lresolv -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /usr/bin/../lib/gcc/aarch64-linux-gnu/11/crtendS.o /lib/aarch64-linux-gnu/crtn.o
 * */


unsigned long get_shadow(unsigned long pointer){
    return ((pointer&0x0000ffffffffffff)>>4)+0xefff00000000;
}

// 可以看到同一个函数里面，由一个tls的随机数，通过异或来生成每个的值
void test1(){
    char a[16];
    char b[16];
//    char* a = alloca(16);
//    char* b = alloca(16);
    memset(a, 'a', 16);
    a[15] = '\0';
    memset(b, 'b', 16);
    b[15] = '\0';
    printf("a=%p 0x%lx\n", a, get_shadow((unsigned long)a));
    printf("b=%p 0x%lx\n", b, get_shadow((unsigned long)b));

    b[16] = 'd';
    printf("a=%s\n", a);
    printf("b=%s\n", b);
}


// 可以看到每个函数栈帧的这个随机数是每次+1，所以从这个栈帧就可以推测出来其他栈帧的id，但其实推测是没有用的，因为你修改不了自己的tag，所以这种方式实际上会更加安全
void test2(int count){
    if (count == 1000){
        return;
    }

    char a1[16];
    char a2[16];
    char a3[16];
    char a4[16];
    char a5[16];
    char a6[16];
    char a7[16];
    char a8[16];
    char a9[16];
    char a10[16];
    printf("0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx 0x%02lx\n",
           ((uint64_t)a1 >>56)&0xff,
           ((uint64_t)a2 >>56)&0xff,
           ((uint64_t)a3 >>56)&0xff,
           ((uint64_t)a4 >>56)&0xff,
           ((uint64_t)a5 >>56)&0xff,
           ((uint64_t)a6 >>56)&0xff,
           ((uint64_t)a7 >>56)&0xff,
           ((uint64_t)a8 >>56)&0xff,
           ((uint64_t)a9 >>56)&0xff,
           ((uint64_t)a10>>56)&0xff);

//    char a[16];
////    char* a = alloca(16);
//    memset(a, 'a', 16);
////    a[32] = 'a';
//    printf("a=%p 0x%lx\n", a, get_shadow((unsigned long)a));

////    char* b = alloca(16);
//    char b[16];
//    printf("b=%p\n", b);
//
//    char c[16];
////    char* c = alloca(16);
//    printf("c=%p\n", c);

    test2(count+1);
}

// 观察不同函数中，hwasan是否采用固定的异或方式
/*
实际上栈帧中所有变量的tag生成借用了异或的特性，a异或b，b中的1位相当于将a对应位取反，b中的0位不改变a的对应位，这看起来就像是一个随机数生成器，可以得到一段连续的不相同的数字。当然数字可以继续增加，只要增加fastmask数组即可
假设上面真的是一个随机数生成器，那么每个栈帧中将种子a加1，得到的这两条链中相同值的碰撞概率就应该不会很大，我们可以进一步做个验证。
HWASan采用这种方案的好处就在于，假设溢出对象的随机数是确定的，那么与之具有相同tag的对象也就是固定的，而且由于随机数的特性这往往会比较远。我们可以测试下不同取值下有哪些对象是可以溢出的。
考虑到真任意内存访问是可以修改的高位tag的，所以还是要从juliet里面对攻击进行分类，现在显而易见的可以分为上下界临近溢出、固定/有限offset的非临近溢出、任意内存访问(任意内存访问是否多见？)
在评估时，可以让堆以及栈来交叉，比如堆里面可以用非临近溢出，栈里面可以举临近溢出的例子
固定的堆地址会有什么问题？因为堆的分配顺序是不变的，所以可以构建确定的payload等碰撞成功即可

可以用以下python函数来模拟
a = 0x78*8
fastmask = [0,  128, 64,  192, 32,  96,  224, 112, 240,
            48, 16,  120, 248, 56,  24,  8,   124, 252,
            60, 28,  12,  4,   126, 254, 62,  30,  14,
            6,  2,   127, 63,  31,  15,  7,   3,   1]

all_tags = list()
for i in range(1000):
    cur_random = (a >> 3) & 0xff
    cur_tags = list()
    for i in range(20):
        tag = cur_random ^ fastmask[i%len(fastmask)] & 0xff
        cur_tags.append(tag)
        print("{:4}, ".format(hex(tag)), end="")
    print()
    all_tags.append(cur_tags)
    a += 8

 * */

void test3(){
    char* a1 = alloca(16);
    char* a2 = alloca(16);
    char* a3 = alloca(16);
    char* a4 = alloca(16);
    char* a5 = alloca(16);
    char* a6 = alloca(16);
    char* a7 = alloca(16);
    char* a8 = alloca(16);
    char* a9 = alloca(16);
    char* a10 = alloca(16);

    printf("%p %p\n", a1, a2);
}

void test4(){
    char* a1 = alloca(16);
    char* a2 = alloca(16);
    char* a3 = alloca(16);
    char* a4 = alloca(16);
    char* a5 = alloca(16);
    char* a6 = alloca(16);
    char* a7 = alloca(16);
    char* a8 = alloca(16);
    char* a9 = alloca(16);
    char* a10 = alloca(16);
}

// 测试所有的局部变量指针都会提前在函数入口加tag
void test5(){
    for (int i=0;i<1000;i++){
        char a[16];
        memset(a, 'a', 16);
        printf("a=%p 0x%lx\n", a, get_shadow((unsigned long)a));
    }
}

int test65(){
    char* a = alloca(16);
    char* b = alloca(16);

    uint8_t a_tag = ((uint64_t)a>>56) & 0xff;
    uint8_t b_tag = ((uint64_t)b>>56) & 0xff;
    printf("a_tag=%d b_tag=%d\n", a_tag, b_tag);

    if(a_tag == b_tag)
        return 1;
    else
        return 0;
}
// 测试在-mllvm --hwasan-generate-tags-with-calls模式下，采用随机数的方式，多大概率会导致相邻的两个tag相同
// /asan/ASan-LLVM/llvm/cmake-build-debug-orighwasan/bin/clang -mllvm --hwasan-generate-tags-with-calls -fsanitize=hwaddress -O0 -o main16 main16.c
// 结果相同，都是概率接近0.0039
void test6(){
    unsigned int count = 0;
    unsigned int num = 1000000;
    for(unsigned long i=0; i<num; i++){
        int retu = test65();
        if (retu == 1){
            count += 1;
        }
    }
    printf("%u/%u %f\n", count, num, (double)(count) / num);
}

// 验证测试堆分配出现连续两个相同低位的概率
// 尽管堆分配使用了xorshift，其具有良好的随机数周期，即不太可能出现连续两个相同的情况，否则xorshift生成的所有随机数都应该是相同的。所以两个随机数相同的概率并不能简单看作是1/2^32，因为一个是x，另一个应该肯定不会还是x。
// 但是问题在于，即便是最新版的llvm，其tag生成仍然使用random&0xff的方式，这是随机数周期就无法保证相邻两个必不相同了，实际测试下来可以看到连续两个random的低位8bit相同的概率是1/256.
// 其实一个最简单的修改办法就是改写为xorshift8，但是多线程、多region、释放后重用，没办法保证两个相邻的chunk为连续生成的随机数，所以还是保证不了
// /asan/ASan-LLVM/llvm/cmake-build-debug-orighwasan/bin/clang -fsanitize=hwaddress -O0 -o main16 main16.c
// 目前的测试结果和预期相同，概率接近0.0039
void test7(){
    unsigned int count = 0;
    unsigned int num = 1000000;
    for(unsigned long i=0; i<num; i++){
        char* a = malloc(16);
        char* b = malloc(16);
        uint8_t a_tag = ((uint64_t)a>>56) & 0xff;
        uint8_t b_tag = ((uint64_t)b>>56) & 0xff;

        if (a_tag == b_tag){
            count += 1;
            printf("finding!\n");
            printf("a=%p a_tag=0x%x b=%p b_tag=0x%x\n", a, a_tag, b, b_tag);
        }
    }
    printf("%u/%u %f\n", count, num, (double)(count) / num);
}

int* test85(){
    int retu_intvar = 16;
    char* retu_arrayvar = alloca(16);
    printf("%p %p\n", &retu_intvar, retu_arrayvar);
    return &retu_intvar;
}
void test8(){
    int* stack_var = test85();
}

// 测试内存随机化
void test9(){
    for (int i=0; i<100; i++){
        void* ptr = malloc(16);
        printf("%p\n", ptr);
    }
}


// 总结下，栈对象和堆对象都添加了tag标记，两者都支持顺序递增或是随机数的tag，其中栈对象默认使用递增的tag方案，其问题在于两个栈帧可以推算出来。而堆对象默认使用基于随机数的tag方案。
// 递增tag的优势在于两个相邻的chunk不会有相同的tag，但在信息泄露时容易被预测。随机数tag的优势在于不容易被预测，但是其可能存在两个相邻的chunk具有相同的tag
// 我们的攻击场景考虑邻近溢出以及任意内存访问两种tag方案。对于邻近溢出来说，攻击堆的概率是1/256，无法攻击栈；对于任意内存访问来说，攻击堆的概率是1/256，攻击栈的概率借助于泄露信息可以是百分百。
// 基于juliet开展测试。
int main(){
//    test1();
//    test2(1);
//    test3();
//    test5();
//    test6();
//    test7();
    test9();

    return 0;
}