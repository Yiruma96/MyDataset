#include <stdio.h>

void rotateMemoryMarks(int array[], int size) {
    int firstMark = 0;
    int firstNonZeroPos = -1;

    // 从左到右扫描一次，同时记录第一个非0位置
    for (int i = 0; i < size; i++) {
        if (array[i] != 0) {
            if (firstNonZeroPos == -1) {
                firstNonZeroPos = i;
            }
            int temp = array[i];
            array[i] = firstMark;
            firstMark = temp;
        }
    }

    // 如果找到了非0元素，最后一个非0元素要设置为最初保存的第一个值
    if (firstNonZeroPos != -1) {
        array[firstNonZeroPos] = firstMark;
    }
}

// 测试代码
int main() {
    int memory[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    int size = sizeof(memory) / sizeof(memory[0]);

    printf("原始数组：\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", memory[i]);
    }
    printf("\n");

    rotateMemoryMarks(memory, size);

    printf("循环右移后：\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", memory[i]);
    }
    printf("\n");

    // 验证结果是否正确
    // 原始：  0, 2, 0, 4, 0, 6, 0, 8, 0, 10, 0, 12
    // 右移后：0, 12, 0, 2, 0, 4, 0, 6, 0, 8, 0, 10

    return 0;
}