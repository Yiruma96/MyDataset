#include <iostream>
#include <cstdlib>

class CircularQueue {
private:
    int** queue; // 指针数组，每个元素都是一个指针
    int front; // 队列头指针
    int rear; // 队列尾指针
    int size; // 队列的大小

public:
    // 构造函数，初始化队列
    CircularQueue(int size) : front(0), rear(0), size(size) {
        queue = new int*[size]; // 分配指针数组
        for (int i = 0; i < size; ++i) {
            queue[i] = nullptr; // 初始化指针为nullptr
        }
    }

    // 析构函数，释放队列内存
    ~CircularQueue() {
        for (int i = front; i != rear; i = (i + 1) & (size - 1)) {
            delete queue[i]; // 释放指针指向的内存
            queue[i] = nullptr;
        }
        delete[] queue; // 释放指针数组
    }

    // 检查队列是否为空
    bool isEmpty() const {
        return front == rear;
    }

    // 检查队列是否已满
    bool isFull() const {
        return (rear - front) == size;
    }

    // 入队操作
    void enqueue(int* value) {
        if (isFull()) {
            throw std::overflow_error("Queue is full");
        }
        queue[rear] = value;
        rear = (rear + 1) & (size - 1); // 使用位运算替代模运算
    }

    // 出队操作
    int* dequeue() {
        if (isEmpty()) {
            throw std::underflow_error("Queue is empty");
        }
        int* value = queue[front];
        queue[front] = nullptr; // 清除元素，避免悬挂引用
        front = (front + 1) & (size - 1); // 使用位运算替代模运算
        return value;
    }

    // 获取队列头元素
    int* peek() const {
        if (isEmpty()) {
            throw std::underflow_error("Queue is empty");
        }
        return queue[front];
    }
};

int main() {

    uint_64_t
    malloc(1024*1024*1024)

    try {
        const int QUEUE_SIZE = 134217728; // 1GB / 8 bytes
        CircularQueue queue(QUEUE_SIZE); // 创建一个大小为1GB的循环队列

        // 示例：入队操作
        int* data1 = new int(123);
        queue.enqueue(data1);

        // 示例：出队操作
        int* data2 = queue.dequeue();
        std::cout << *data2 << std::endl; // 输出出队的数据
        delete data2; // 释放出队的数据内存

        // 示例：再次入队操作
        int* data3 = new int(456);
        queue.enqueue(data3);

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }
    return 0;
}