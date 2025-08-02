#include "linked_list.h"
#include <stdlib.h>

struct list_node {
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list {
   struct list_node *first, *last;
   int count;
};

struct list *list_create(void){
    struct list *new_list=malloc(sizeof(struct list));
    new_list->first=NULL;
    new_list->last=NULL;
    new_list->count=0;
    return new_list;
}

size_t list_count(const struct list *list){
    if (list == NULL) return 0;
    return list->count;
}

void list_push(struct list *list, ll_data_t item_data){
    struct list_node *node=malloc(2*sizeof(node)+2*sizeof(ll_data_t)+2);
    node->data=item_data;
    if (list->last==NULL && list->first==NULL){
        list->first=node;
        list->last=list->first;
        list->last->next=NULL;
        list->last->prev=NULL;
        list->first->prev=NULL;
        list->first->prev=NULL;
    }
    else if (list->count == 1) {
        node->prev=list->last;
        node->next=NULL;
        list->last=node;
        list->first->next=node;
    }
    else{
        list->last->next=node;
        node->prev=list->last;
        node->next=NULL;
        list->last=node;
    }
    list->count++;
}

ll_data_t list_pop(struct list *list){
    ll_data_t data;
    if (list->last==NULL && list->first==NULL){
        data=0;
    }
    else if (list->first==list->last){
        data=list->first->data;
        list->first=NULL;
        list->last=NULL;
    }
    else{
        data=list->last->data; 
        list->last=list->last->prev;
        list->last->next=NULL;
    }
    list->count--;
    return data;
}

void list_unshift(struct list *list, ll_data_t item_data){
    struct list_node *node=malloc(2*sizeof(node)+2*sizeof(ll_data_t)+2);
    node->data=item_data;
    if (list->last==NULL && list->first==NULL){
        list->first=node;
        list->last=node;
        list->last->next=NULL;
        list->last->prev=NULL;
        list->first->prev=NULL;
        list->first->prev=NULL;
    }
    else if(list->count == 1){
        node->next=list->first;
        node->prev=NULL;
        list->first=node;
        list->last->prev=node;
    }
    else{
        list->first->prev=node;
        node->next=list->first;
        node->prev=NULL;
        list->first=node;
    }
    list->count++;
}

ll_data_t list_shift(struct list *list){
    ll_data_t data;
    if (list->last==NULL && list->first==NULL){
        data=0;
    }
    else if (list->first==list->last){
        data=list->first->data;
        list->first=NULL;
        list->last=NULL;
    }
    else{
        data=list->first->data; 
        list->first=list->first->next;
        list->first->prev=NULL;
    }
    list->count--;
    return data;
}

void list_delete(struct list *list, ll_data_t data){
    struct list_node *node=malloc(2*sizeof(node)+2*sizeof(ll_data_t)+2);
    if (list->first->data==data) list_shift(list);
    else {
        node=list->first->next;
        while (node != NULL) {
            if (node->data==data) {
                if (node->next==NULL){
                    list_pop(list);
                    node=NULL;
                }
                else{
                    node->prev->next=node->next;
                    node->next->prev=node->prev;
                    node=NULL;
                    list->count--;
                }
            }
        }
    }
}

void list_destroy(struct list *list){
    free(list);
}