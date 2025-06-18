// 关于区间树的实验验证

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

#define MAX_INTERVAL_NODES 10000000
typedef uint64_t u64;
#define nullptr NULL
bool hwasan_log = true;
#define Printf printf
#define internal_memset memset

typedef struct IntervalNode {
    u64 low, high;
    u64 maxHigh;
    struct IntervalNode *left, *right;
    int height;
} IntervalNode;

IntervalNode IntervalNodePool[MAX_INTERVAL_NODES];  // Static pool of nodes
IntervalNode* intervalRootNode;  // 用于表示平衡区间树的根节点
int intervalNodeCount = 0;  // 区间树上新插入的节点应该在IntervalNodePool中使用的下标


// Utility function to get maximum of two integers
#define TERVALMAX(a, b) ((a > b) ? a : b)
// Utility function to get the height of the tree
#define TERVALHEIGHT(node) (node == nullptr ? 0 : node->height)

// Create a new Interval Node
IntervalNode* interval_newNode(u64 low, u64 high) {
    IntervalNode* node = &IntervalNodePool[intervalNodeCount++];
    node->low = low;
    node->high = high;
    node->maxHigh = high;
    node->left = node->right = nullptr;
    node->height = 1;  // new node is initially added at leaf
    return node;
}

// Right rotate utility function
IntervalNode* interval_rightRotate(IntervalNode* y) {
    IntervalNode* x = y->left;
    IntervalNode* T2 = x->right;

    x->right = y;
    y->left = T2;

    y->height = TERVALMAX(TERVALHEIGHT(y->left), TERVALHEIGHT(y->right)) + 1;
    x->height = TERVALMAX(TERVALHEIGHT(x->left), TERVALHEIGHT(x->right)) + 1;

    y->maxHigh =
            TERVALMAX(y->high, TERVALMAX((y->left ? y->left->maxHigh : 0),
                                         (y->right ? y->right->maxHigh : 0)));
    x->maxHigh =
            TERVALMAX(x->high, TERVALMAX((x->left ? x->left->maxHigh : 0),
                                         (x->right ? x->right->maxHigh : 0)));

    return x;
}

// Left rotate utility function
IntervalNode* interval_leftRotate(IntervalNode* x) {
    IntervalNode* y = x->right;
    IntervalNode* T2 = y->left;

    y->left = x;
    x->right = T2;

    x->height = TERVALMAX(TERVALHEIGHT(x->left), TERVALHEIGHT(x->right)) + 1;
    y->height = TERVALMAX(TERVALHEIGHT(y->left), TERVALHEIGHT(y->right)) + 1;

    x->maxHigh =
            TERVALMAX(x->high, TERVALMAX((x->left ? x->left->maxHigh : 0),
                                         (x->right ? x->right->maxHigh : 0)));
    y->maxHigh =
            TERVALMAX(y->high, TERVALMAX((y->left ? y->left->maxHigh : 0),
                                         (y->right ? y->right->maxHigh : 0)));

    return y;
}

IntervalNode* interval_balanceTree(IntervalNode* node, u64 low, u64 high) {
    int balance = (TERVALHEIGHT(node->left)) - (TERVALHEIGHT(node->right));
    if (balance > 1 && low < node->left->low)
        return interval_rightRotate(node);
    if (balance < -1 && low > node->right->low)
        return interval_leftRotate(node);
    if (balance > 1 && low > node->left->low) {
        node->left = interval_leftRotate(node->left);
        return interval_rightRotate(node);
    }
    if (balance < -1 && low < node->right->low) {
        node->right = interval_rightRotate(node->right);
        return interval_leftRotate(node);
    }
    return node;
}

// xie. 用于检查区间树中是否有给定区间
bool _interval_overlapSearch(IntervalNode* root, u64 low, u64 high) {
    // 递归退出条件————当前节点不存在时，表示没有搜索到该区间，返回不重叠
    if (root == nullptr)
        return false;

    // 检查目标interval是否在当前节点的范围内
    if (root->low <= high && low <= root->high)
        return true;
        // 否则检查左子树
    else if (root->low > high)
        return _interval_overlapSearch(root->left, low, high);
        // 检查右子树
    else
        return _interval_overlapSearch(root->right, low, high);
}

bool interval_overlapSearch(u64 low, u64 high) {
//    SpinMutexLock l(&intervaltree_fallback_mutex);

    if (intervalRootNode == nullptr)
        Printf("intervalRootNode %p 初始化异常，无法执行overlapSearch函数\n",
               &intervalRootNode);
    return _interval_overlapSearch(intervalRootNode, low, high);
}

// 向区间树中插入一个区间节点，同时维护二叉树的平衡
IntervalNode* _interval_insert(IntervalNode* root, u64 low, u64 high) {
    // 退出条件————如果当前节点为空，表示发现了可以填入的位置，新建该节点并返回即可
    if (root == nullptr)
        return (interval_newNode(low, high));

    // 经典二叉树搜索算法——根据当前的root节点进行处理，然后递归的处理后续节点
    if (high < root->low)
        // 如果该区间右边界小于root区间的话，则递归的检查左子树，注意insert函数返回值要挂上去
        root->left = _interval_insert(root->left, low, high);
    else if (low > root->high)
        // 如果该区间左边界大于root区间的话，则递归的检查右子树，注意insert函数返回值要挂上去
        root->right = _interval_insert(root->right, low, high);
    else {
        // 退出条件2————该区间落入当前节点中，报错
        Printf("Error: Interval [0x%lx, 0x%lx] overlaps with existing intervals.\n",
               low, high);
        exit(1);
    }

    // 后面的二叉树平衡操作建立在每个节点的node->height和node->maxHigh两个信息之上，要进行维护
    // root->height表示该节点子树的高度，平衡二叉树要保证同层节点的height差不超过1，从而保证操作的效率。加1的原因是interval必然会加入到该子节点下面，所以height要+1
    root->height =
            1 + TERVALMAX(TERVALHEIGHT(root->left), TERVALHEIGHT(root->right));
    // root->height特别在区间树中使用，记录为该节点树下面区间的最大值
    root->maxHigh = TERVALMAX(
            root->high, TERVALMAX((root->left ? root->left->maxHigh : 0),
                                  (root->right ? root->right->maxHigh : 0)));

    // 每次插入操作后，重新维护二叉树的平衡
    return interval_balanceTree(root, low, high);
}

// 初始化区间树
// note. 调用init_interval_tree函数后，记得自己传入shadow memory的范围:
void init_interval_tree() {
    // xielog.
    if (hwasan_log)
        Printf("Init intervalRootNode = %p\n", &intervalRootNode);

    // 重置节点区间即可
    internal_memset(IntervalNodePool, 0, sizeof(IntervalNode) * MAX_INTERVAL_NODES);
    intervalRootNode = nullptr;
    intervalNodeCount = 0;

    // 然后插入几个基本的内存区间
    intervalRootNode = _interval_insert(nullptr, 0x0000ffff00000000, 0x0000ffffffffffff);  // 可能用作栈
//    if (hwasan_shadow_memory_dynamic_address == 0) {
//        Printf("还没有初始化hwasan_shadow_memory_dynamic_address\n");
//        internal__exit(1);
//    }
//    intervalRootNode = _interval_insert(intervalRootNode, hwasan_shadow_memory_dynamic_address, hwasan_shadow_memory_dynamic_end);  // 可能用作shadow memory

    return;
}

void interval_insert(u64 low, u64 high) {
//    SpinMutexLock l(&intervaltree_fallback_mutex);

    // 每次插入前检查区间树是否达到了承载上限
    if (intervalNodeCount >= MAX_INTERVAL_NODES) {
        init_interval_tree();

        // xielog.
        if (hwasan_log)
            Printf("区间树中记录的区间数量已达到%ld，将其置空\n", MAX_INTERVAL_NODES);
    }

    if (intervalRootNode == nullptr && intervalNodeCount != 0)
        Printf("intervalRootNode初始化异常，无法执行insert函数\n");

    intervalRootNode = _interval_insert(intervalRootNode, low, high);
    return;
}

// Helper function to print spaces
void interval_printSpaces(int count) {
    for (int i = 0; i < count; i++) {
        Printf(" ");
    }
}

// 形式化的打印该二叉搜索树，以右子树，根节点，左子树的方式打印，这保证了第一行是最右边的节点。
void interval_printTree(IntervalNode* node, int space) {
    // Base case
    if (node == nullptr) {
        return;
    }

    // Increase distance between levels
    int levelGap = 10;  // Define the gap between levels
    space += levelGap;

    // Process right child first
    interval_printTree(node->right, space);

    // Print current node after space count
    Printf("\n");
    interval_printSpaces(space - levelGap);
    Printf("|-- ");
    Printf("[%lu, %lu]\n", node->low, node->high);

    // Process left child
    interval_printTree(node->left, space);
}



#define NUM_RANGES 10000000 // 需要生成的范围数量
#define RAND_INTERVAL_LOW_BOUND 0x000000000000 // 随机区间的低端范围
#define RAND_INTERVAL_HIGH_BOUND 0xffffffffffff // 随机区间的高端范围
typedef uint64_t u64;

typedef struct {
    u64 low;
    u64 high;
} Range;

// 生成不重叠的范围
void generateNonOverlappingRanges(Range* ranges, int numRanges) {
    // 使用当前时间初始化随机数生成器
    srand(time(NULL));
    init_interval_tree();

    for (int i = 0; i < numRanges; ++i) {
        // 生成随机的低端范围
        u64 low = RAND_INTERVAL_LOW_BOUND + rand() % (RAND_INTERVAL_HIGH_BOUND - RAND_INTERVAL_LOW_BOUND + 1);
        // 生成随机的高端范围
        u64 high = low + 100;

        // 确保生成的范围不与已有的范围重叠
        if (interval_overlapSearch(low, high) == true){
            --i;
            continue;
        }

        // 存储生成的范围
        interval_insert(low, high);
        ranges[i].low = low;
        ranges[i].high = high;
        if (i%100 == 0)
            printf("i=%d\n", i);
    }
}

// 将范围写入文件
void writeRangesToFile(const char *filename, Range* ranges, int numRanges) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        return;
    }

    for (int i = 0; i < numRanges; ++i) {
        fprintf(file, "%llu %llu\n", ranges[i].low, ranges[i].high);
    }

    fclose(file);
}

int main() {
    // 生成不重叠的范围
    Range* ranges = malloc(sizeof(Range)*NUM_RANGES);
    generateNonOverlappingRanges(ranges, NUM_RANGES);

    // 将范围写入文件
    writeRangesToFile("ranges.txt", ranges, NUM_RANGES);

    printf("Non-overlapping ranges generated and written to file \"ranges.txt\"\n");

    return 0;
}