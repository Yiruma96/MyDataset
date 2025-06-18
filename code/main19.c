// 测试循环链表
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include "stdint.h"
#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>
#include "stdbool.h"
#include <string.h>


typedef struct HWASanCircularQueue{
    void** data; // 指针数组，每个元素都是一个指针
    uint64_t front; // 队列头指针
    uint64_t rear; // 队列尾指针
    uint64_t capacity; // 队列的大小
    uint64_t mask;
    uint64_t length;
} HWASanCircularQueue;

void HWASanCircularQueueInit(HWASanCircularQueue* queue, void* queue_base, uint64_t byte_size){
    queue->front = 0;
    queue->rear = 0;

    queue->data = (void**)queue_base;
    queue->capacity = byte_size / 8;
    queue->mask = queue->capacity - 1;
    if ((queue->capacity & queue->mask) != 0) { // 检查是否为2的幂次方
        printf("队列并非2的次方\n");
        exit(1);
    }
};

// 入队操作
void HWASanCircularQueueEnqueue(HWASanCircularQueue* queue, void* value) {
    if (queue->length == queue->capacity) {
        printf("Queue is full\n");
        exit(1);
    }
    queue->data[queue->rear] = value;

    // rear+1，使用位运算替代模运算
    queue->rear = (queue->rear + 1) & queue->mask; // 使用位运算替代模运算
    queue->length += 1;
}

// 出队操作
void* HWASanCircularQueueDequeue(HWASanCircularQueue* queue) {
    if (queue->length == 0) {
        printf("Queue is empty\n");
        exit(1);
    }
    void* value = queue->data[queue->front];
    queue->data[queue->front] = NULL; // 清除元素，避免悬挂引用

    // front+1，使用位运算替代模运算
    queue->front = (queue->front + 1) & queue->mask;
    queue->length -= 1;
    return value;
}



int main() {
    uint64_t QUEUE_SIZE = 1024; // 1GB
    void* queue_base = malloc(QUEUE_SIZE);
    HWASanCircularQueue* queue = (HWASanCircularQueue*)malloc(sizeof(HWASanCircularQueue));
    memset(queue, 0, sizeof(HWASanCircularQueue));
    HWASanCircularQueueInit(queue, queue_base, QUEUE_SIZE);

    // 示例：入队操作
    for (uint64_t i=1; i<10; i++){
        HWASanCircularQueueEnqueue(queue, (void*)i);
        printf("队列尾部插入%d, front=%d rear=%d\n", i, queue->front, queue->rear);
    }

    // 示例：出队操作
    for (uint64_t i=1; i<5; i++){
        void* retu = HWASanCircularQueueDequeue(queue);
        printf("队列头部输出%d, front=%d rear=%d\n", (uint64_t)retu, queue->front, queue->rear);
    }

    // 示例：入队操作
    for (uint64_t i=1; i<124; i++){
        HWASanCircularQueueEnqueue(queue, (void*)i);
        printf("队列尾部插入%d, front=%d rear=%d\n", i, queue->front, queue->rear);
    }

    // 示例：出队操作
//    for (uint64_t i=1; i<130; i++){
//        void* retu = HWASanCircularQueueDequeue(queue);
//        printf("队列头部输出%d, front=%d rear=%d\n", (uint64_t)retu, queue->front, queue->rear);
//    }


//    void* p1 = (void*)0x400500;
//    void* p2 = (void*)0x400600;
//    HWASanCircularQueueEnqueue(queue, p1);
//    HWASanCircularQueueEnqueue(queue, p2);

    for (uint64_t i=0; i<queue->length; i++){
        printf("#%d %p\n", i, queue->data[(queue->front+i)&queue->mask]);
    }

//        // 示例：出队操作
//        int* data2 = queue.dequeue();
//        std::cout << *data2 << std::endl; // 输出出队的数据
//        delete data2; // 释放出队的数据内存
//
//        // 示例：再次入队操作
//        int* data3 = new int(456);
//        queue.enqueue(data3);

    return 0;
}