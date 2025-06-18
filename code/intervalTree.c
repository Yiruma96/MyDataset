#include <stdio.h>
#include <stdlib.h>



typedef struct Interval {
    u_int64_t low, high;
} Interval;

typedef struct IntervalNode {
    u_int64_t low, high;
    u_int64_t maxHigh;
    struct IntervalNode *left, *right;
    int height;
} IntervalNode;

#define MAX_NODES 100  // Maximum number of nodes in the interval tree
IntervalNode nodePool[MAX_NODES];  // Static pool of nodes
int nodeCount = 0;  // Indexer for the next node to use

// Utility function to get maximum of two integers
#define TERVALMAX(a,b) ((a > b) ? a : b)
// Utility function to get the height of the tree
#define TERVALHEIGHT(node) (node==NULL? 0:node->height)


// Create a new Interval Node
IntervalNode* newNode(u_int64_t low, u_int64_t high) {
    IntervalNode* node = &nodePool[nodeCount++];
    node->low = low;
    node->high = high;
    node->maxHigh = high;
    node->left = node->right = NULL;
    node->height = 1;  // new node is initially added at leaf
    return node;
}

// Right rotate utility function
IntervalNode* rightRotate(IntervalNode *y) {
    IntervalNode *x = y->left;
    IntervalNode *T2 = x->right;

    x->right = y;
    y->left = T2;

    y->height = TERVALMAX(TERVALHEIGHT(y->left), TERVALHEIGHT(y->right)) + 1;
    x->height = TERVALMAX(TERVALHEIGHT(x->left), TERVALHEIGHT(x->right)) + 1;

    y->maxHigh = TERVALMAX(y->high, TERVALMAX((y->left ? y->left->maxHigh : 0), (y->right ? y->right->maxHigh : 0)));
    x->maxHigh = TERVALMAX(x->high, TERVALMAX((x->left ? x->left->maxHigh : 0), (x->right ? x->right->maxHigh : 0)));

    return x;
}

// Left rotate utility function
IntervalNode* leftRotate(IntervalNode *x) {
    IntervalNode *y = x->right;
    IntervalNode *T2 = y->left;

    y->left = x;
    x->right = T2;

    x->height = TERVALMAX(TERVALHEIGHT(x->left), TERVALHEIGHT(x->right)) + 1;
    y->height = TERVALMAX(TERVALHEIGHT(y->left), TERVALHEIGHT(y->right)) + 1;

    x->maxHigh = TERVALMAX(x->high, TERVALMAX((x->left ? x->left->maxHigh : 0), (x->right ? x->right->maxHigh : 0)));
    y->maxHigh = TERVALMAX(y->high, TERVALMAX((y->left ? y->left->maxHigh : 0), (y->right ? y->right->maxHigh : 0)));

    return y;
}


IntervalNode* balanceTree(IntervalNode* node, u_int64_t low, u_int64_t high) {
    int balance = (TERVALHEIGHT(node->left)) - (TERVALHEIGHT(node->right));
    if (balance > 1 && low < node->left->low)
        return rightRotate(node);
    if (balance < -1 && low > node->right->low)
        return leftRotate(node);
    if (balance > 1 && low > node->left->low) {
        node->left = leftRotate(node->left);
        return rightRotate(node);
    }
    if (balance < -1 && low < node->right->low) {
        node->right = rightRotate(node->right);
        return leftRotate(node);
    }
    return node;
}

// Function to check if any interval in the tree overlaps with the given interval
int overlapSearch(IntervalNode *root, u_int64_t low, u_int64_t high) {
    // 递归退出条件————当前节点不存在时，表示没有搜索到该区间，返回不重叠
    if (root == NULL)
        return 0;

    // 检查目标interval是否在当前节点的范围内
    if (root->low <= high && low <= root->high)
        return 1;
    // 否则检查左子树
    else if (root->low > high)
        return overlapSearch(root->left, low, high);
    // 检查右子树
    else
        return overlapSearch(root->right, low, high);
}

// 向平衡二叉树中插入一个节点
IntervalNode* insert(IntervalNode* root, u_int64_t low, u_int64_t high) {
    // 退出条件————如果当前节点为空，表示发现了可以填入的位置，新建该节点并返回即可
    if (root == NULL)
        return(newNode(low, high));

    // 经典二叉树搜索算法——根据当前的root节点进行处理，然后递归的处理后续节点
    if (high < root->low)
        // 如果该区间右边界小于root区间的话，则递归的检查左子树，注意insert函数返回值要挂上去
        root->left = insert(root->left, low, high);
    else if (low > root->high)
        // 如果该区间左边界大于root区间的话，则递归的检查右子树，注意insert函数返回值要挂上去
        root->right = insert(root->right, low, high);
    else{
        // 退出条件2————该区间落入当前节点中，报错
        printf("Error: Interval [0x%lx, 0x%lx] overlaps with existing intervals.\n", low, high);
        exit(1);
    }

    // 后面的二叉树平衡操作建立在每个节点的node->height和node->maxHigh两个信息之上，要进行维护
    // root->height表示该节点子树的高度，平衡二叉树要保证同层节点的height差不超过1，从而保证操作的效率。加1的原因是interval必然会加入到该子节点下面，所以height要+1
    root->height = 1 + TERVALMAX(TERVALHEIGHT(root->left), TERVALHEIGHT(root->right));
    // root->height特别在区间树中使用，记录为该节点树下面区间的最大值
    root->maxHigh = TERVALMAX(root->high, TERVALMAX((root->left ? root->left->maxHigh : 0), (root->right ? root->right->maxHigh : 0)));

    // 每次插入操作后，重新维护二叉树的平衡
    return balanceTree(root, low, high);
}


// 前序打印二叉搜索树，即根节点，左节点，右节点
void preOrder(IntervalNode *root) {
    if (root != NULL) {
        printf("[%lu, %lu] max = 0x%lx \n", root->low, root->high, root->maxHigh);
        preOrder(root->left);
        preOrder(root->right);
    }
}

// Helper function to print spaces
void printSpaces(int count) {
    for (int i = 0; i < count; i++) {
        printf(" ");
    }
}

// 形式化的打印该二叉搜索树，以右子树，根节点，左子树的方式打印，这保证了第一行是最右边的节点。
void printTree(IntervalNode* node, int space) {
    // Base case
    if (node == NULL) {
        return;
    }

    // Increase distance between levels
    int levelGap = 10;  // Define the gap between levels
    space += levelGap;

    // Process right child first
    printTree(node->right, space);

    // Print current node after space count
    printf("\n");
    printSpaces(space - levelGap);
    printf("|-- ");
    printf("[%lu, %lu]\n", node->low, node->high);

    // Process left child
    printTree(node->left, space);
}



int main() {
    Interval intervals[] = {{15, 16}, {17, 19}, {21, 22}, {33, 43}, {5, 10}};
    int n = sizeof(intervals)/sizeof(intervals[0]);
    IntervalNode *root = NULL;
    for (int i = 0; i < n; i++) {
        root = insert(root, intervals[i].low, intervals[i].high);
    }

    printf("Preorder traversal of the constructed Interval Tree is\n");

    if (overlapSearch(root, 13, 15)) {
        printf("\nInterval overlaps with existing intervals.\n");
    } else {
        printf("\nInterval does not overlap with existing intervals.\n");
    }

    printf("Visual representation of the Interval Tree:\n");
    printTree(root, 0);

    return 0;
}