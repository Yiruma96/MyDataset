// 关于红黑树的实验验证

#include <stdio.h>
#include <stdlib.h>

// 定义红黑树节点的结构
typedef struct RBTreeNode {
    int data;
    enum { RED, BLACK } color;
    struct RBTreeNode *left, *right, *parent;
} RBTreeNode;

// 定义红黑树的结构
typedef struct RBTree {
    RBTreeNode *root;
} RBTree;

// 创建一个新的红黑树节点
RBTreeNode *RBCreateNode(int data) {
    RBTreeNode *newNode = (RBTreeNode *)malloc(sizeof(RBTreeNode));
    newNode->data = data;
    newNode->color = RED;
    newNode->left = newNode->right = newNode->parent = NULL;
    return newNode;
}

// 红黑树左旋
void RBLeftRotate(RBTree *tree, RBTreeNode *x) {
    RBTreeNode *y = x->right;
    x->right = y->left;
    if (y->left != NULL)
        y->left->parent = x;
    y->parent = x->parent;
    if (x->parent == NULL)
        tree->root = y;
    else if (x == x->parent->left)
        x->parent->left = y;
    else
        x->parent->right = y;
    y->left = x;
    x->parent = y;
}

// 红黑树右旋
void RBRightRotate(RBTree *tree, RBTreeNode *y) {
    RBTreeNode *x = y->left;
    y->left = x->right;
    if (x->right != NULL)
        x->right->parent = y;
    x->parent = y->parent;
    if (y->parent == NULL)
        tree->root = x;
    else if (y == y->parent->right)
        y->parent->right = x;
    else
        y->parent->left = x;
    x->right = y;
    y->parent = x;
}

// 红黑树插入修正
void RBInsertFixup(RBTree *tree, RBTreeNode *z) {
    while (z != tree->root && z->parent->color == RED) {
        if (z->parent == z->parent->parent->left) {
            RBTreeNode *y = z->parent->parent->right;
            if (y != NULL && y->color == RED) {
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else {
                if (z == z->parent->right) {
                    z = z->parent;
                    RBLeftRotate(tree, z);
                }
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                RBRightRotate(tree, z->parent->parent);
            }
        } else {
            RBTreeNode *y = z->parent->parent->left;
            if (y != NULL && y->color == RED) {
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else {
                if (z == z->parent->left) {
                    z = z->parent;
                    RBRightRotate(tree, z);
                }
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                RBLeftRotate(tree, z->parent->parent);
            }
        }
    }
    tree->root->color = BLACK;
}

// 红黑树插入操作
void RBInsert(RBTree *tree, int data) {
    RBTreeNode *z = RBCreateNode(data);
    RBTreeNode *y = NULL;
    RBTreeNode *x = tree->root;
    while (x != NULL) {
        y = x;
        if (z->data < x->data)
            x = x->left;
        else
            x = x->right;
    }
    z->parent = y;
    if (y == NULL)
        tree->root = z;
    else if (z->data < y->data)
        y->left = z;
    else
        y->right = z;
    RBInsertFixup(tree, z);
}

// 红黑树中序遍历（用于测试）
void RBInorderTraversal(RBTreeNode *node) {
    if (node != NULL) {
        RBInorderTraversal(node->left);
        printf("%d ", node->data);
        RBInorderTraversal(node->right);
    }
}

// 红黑树搜索
RBTreeNode *RBSearch(RBTreeNode *root, int key) {
    if (root == NULL || root->data == key)
        return root;
    if (root->data < key)
        return RBSearch(root->right, key);
    return RBSearch(root->left, key);
}

// 辅助函数：红黑树替换子树
void RBTransplant(RBTree *tree, RBTreeNode *u, RBTreeNode *v) {
    if (u->parent == NULL)
        tree->root = v;
    else if (u == u->parent->left)
        u->parent->left = v;
    else
        u->parent->right = v;
    if (v != NULL)
        v->parent = u->parent;
}

// 辅助函数：查找红黑树中的最小节点
RBTreeNode *RBMinimum(RBTreeNode *node) {
    while (node->left != NULL)
        node = node->left;
    return node;
}

// 红黑树删除修正
void RBDeleteFixup(RBTree *tree, RBTreeNode *x, RBTreeNode *xParent) {
    while (x != tree->root && (x == NULL || x->color == BLACK)) {
        if (x == xParent->left) {
            RBTreeNode *w = xParent->right;
            if (w->color == RED) {
                w->color = BLACK;
                xParent->color = RED;
                RBLeftRotate(tree, xParent);
                w = xParent->right;
            }
            if ((w->left == NULL || w->left->color == BLACK) &&
                (w->right == NULL || w->right->color == BLACK)) {
                w->color = RED;
                x = xParent;
                xParent = x->parent;
            } else {
                if (w->right == NULL || w->right->color == BLACK) {
                    if (w->left != NULL)
                        w->left->color = BLACK;
                    w->color = RED;
                    RBRightRotate(tree, w);
                    w = xParent->right;
                }
                w->color = xParent->color;
                xParent->color = BLACK;
                if (w->right != NULL)
                    w->right->color = BLACK;
                RBLeftRotate(tree, xParent);
                x = tree->root;
            }
        } else {
            RBTreeNode *w = xParent->left;
            if (w->color == RED) {
                w->color = BLACK;
                xParent->color = RED;
                RBRightRotate(tree, xParent);
                w = xParent->left;
            }
            if ((w->right == NULL || w->right->color == BLACK) &&
                (w->left == NULL || w->left->color == BLACK)) {
                w->color = RED;
                x = xParent;
                xParent = x->parent;
            } else {
                if (w->left == NULL || w->left->color == BLACK) {
                    if (w->right != NULL)
                        w->right->color = BLACK;
                    w->color = RED;
                    RBLeftRotate(tree, w);
                    w = xParent->left;
                }
                w->color = xParent->color;
                xParent->color = BLACK;
                if (w->left != NULL)
                    w->left->color = BLACK;
                RBRightRotate(tree, xParent);
                x = tree->root;
            }
        }
    }
    if (x != NULL)
        x->color = BLACK;
}

// 红黑树删除
void RBDelete(RBTree *tree, int key) {
    RBTreeNode *z = RBSearch(tree->root, key);
    if (z == NULL)
        return;

    RBTreeNode *y = z;
    RBTreeNode *x, *xParent;
    int yOrigColor = y->color;

    if (z->left == NULL) {
        x = z->right;
        xParent = z->parent;
        RBTransplant(tree, z, z->right);
    } else if (z->right == NULL) {
        x = z->left;
        xParent = z->parent;
        RBTransplant(tree, z, z->left);
    } else {
        y = RBMinimum(z->right);
        yOrigColor = y->color;
        x = y->right;
        if (y->parent == z)
            xParent = y;
        else {
            xParent = y->parent;
            RBTransplant(tree, y, y->right);
            y->right = z->right;
            y->right->parent = y;
        }
        RBTransplant(tree, z, y);
        y->left = z->left;
        y->left->parent = y;
        y->color = z->color;
    }
    free(z);

    if (yOrigColor == BLACK)
        RBDeleteFixup(tree, x, xParent);
}

int main() {
    RBTree tree = {NULL};

    // 插入一些数据进行测试
    RBInsert(&tree, 10);
    RBInsert(&tree, 20);
    RBInsert(&tree, 30);
    RBInsert(&tree, 15);
    RBInsert(&tree, 25);
    RBDelete(&tree, 11);

    // 搜索并打印结果
    printf("Inorder traversal of the tree: ");
    RBInorderTraversal(tree.root);
    printf("\n");

    int searchKey = 20;
    RBTreeNode *result = RBSearch(tree.root, searchKey);
    if (result != NULL)
        printf("Found %d in the tree.\n", searchKey);
    else
        printf("%d is not found in the tree.\n", searchKey);

    return 0;
}
