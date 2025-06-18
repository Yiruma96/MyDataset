#include <iostream>
#include <vector>

int main() {
    // 使用 std::vector 创建一个整数数组
    std::vector<int> vec = {1, 2, 3, 4, 5};

    // 输出 vector 中的元素
    for (int i : vec) {
        std::cout << i << " ";
    }
    std::cout << std::endl;

    return 0;
}

