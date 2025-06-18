// 测试单链表用

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// 定义链表节点结构
typedef struct Node {
    void *data;
    struct Node *next;
} Node;

// 定义链表结构
typedef struct {
    Node *head;
    pthread_mutex_t lock;
} LinkedList;

// 初始化链表
void init_list(LinkedList *list) {
    list->head = NULL;
    pthread_mutex_init(&list->lock, NULL);
}

// 添加元素到链表
void add_to_list(LinkedList *list, void *data) {
    pthread_mutex_lock(&list->lock);
    Node *new_node = (Node *)malloc(sizeof(Node));
    new_node->data = data;
    new_node->next = list->head;
    list->head = new_node;
    pthread_mutex_unlock(&list->lock);
}

// 从链表删除元素
int remove_from_list(LinkedList *list, void *data) {
    pthread_mutex_lock(&list->lock);
    Node *current = list->head;
    Node *previous = NULL;
    while (current != NULL) {
        if (current->data == data) {
            if (previous == NULL) {
                list->head = current->next;
            } else {
                previous->next = current->next;
            }
            free(current);
            pthread_mutex_unlock(&list->lock);
            return 1;  // 成功删除
        }
        previous = current;
        current = current->next;
    }
    pthread_mutex_unlock(&list->lock);
    return 0;  // 未找到元素
}

// 打印链表元素
void print_list(LinkedList *list) {
    pthread_mutex_lock(&list->lock);
    Node *current = list->head;
    while (current != NULL) {
        printf("%p ", current->data);
        current = current->next;
    }
    printf("\n");
    pthread_mutex_unlock(&list->lock);
}

// 清理链表
void free_list(LinkedList *list) {
    pthread_mutex_lock(&list->lock);
    Node *current = list->head;
    while (current != NULL) {
        Node *next = current->next;
        free(current);
        current = next;
    }
    list->head = NULL;
    pthread_mutex_unlock(&list->lock);
    pthread_mutex_destroy(&list->lock);
}

int main() {
    LinkedList list;
    init_list(&list);

    add_to_list(&list, (void *)0x12345);
    add_to_list(&list, (void *)0x67890);
    add_to_list(&list, (void *)0xabcde);

    print_list(&list);

    remove_from_list(&list, (void *)0x67890);
    print_list(&list);

    free_list(&list);

    return 0;
}
