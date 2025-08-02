#include "list_ops.h"

list_t *new_list(size_t length, list_element_t elements[]){
    list_t *list=calloc(length+10, sizeof(list_element_t));
    list->length=length;
    for(size_t i=0;i<list->length;i++){
        list->elements[i]=elements[i];
    }
    return list;
}

size_t length_list(list_t *list){
    return list->length;
}

void delete_list(list_t *list){
    free(list);
}

list_t *append_list(list_t *list1, list_t *list2){
    list_t *list=calloc((list1->length)+(list2->length)+10, sizeof(list_element_t));
    list->length=(list1->length)+(list2->length);
    for(size_t i=0;i<list1->length;i++){
        list->elements[i]=list1->elements[i];
    }
    for(size_t i=0;i<list2->length;i++){
        list->elements[i+list1->length]=list2->elements[i];
    }
    return list;
}

list_t *filter_list(list_t *list, bool (*filter)(list_element_t)){
    list_t *filtered=calloc(list->length+10,sizeof(list_element_t));
    filtered->length=list->length;
    size_t j=0;
    for(size_t i=0;i<list->length;i++){
        if ((*filter)(list->elements[i])){
            filtered->elements[j]=(list->elements[i]);
            j++;
        }
    }
    filtered->length=j;
    return filtered;
}

list_t *map_list(list_t *list, list_element_t (*map)(list_element_t)){
    list_t *mapped=calloc(list->length+10, sizeof(list_element_t));
    mapped->length=list->length;
    for(size_t i=0;i<list->length;i++){
        mapped->elements[i]=(*map)(list->elements[i]);
    }
    return mapped;
}

list_element_t foldl_list(list_t *list, list_element_t initial,
                          list_element_t (*foldl)(list_element_t,
                                                  list_element_t)){

    list_element_t folded=initial;
    for(size_t i=0;i<list->length;i++){
        folded=(*foldl)(list->elements[i],folded);
    }
    return folded;
}

list_element_t foldr_list(list_t *list, list_element_t initial,
                          list_element_t (*foldr)(list_element_t,
                                                  list_element_t)){
    list_element_t folded=initial;
    for(size_t i=0;i<list->length;i++){
        folded=(*foldr)(list->elements[list->length-i-1],folded);
    }
    return folded;
}

list_t *reverse_list(list_t *list){
    list_t *reverse=calloc(list->length+10, sizeof(list_element_t));
    reverse->length=list->length;
    for(size_t i=0;i<list->length;i++){
        reverse->elements[i]=list->elements[list->length-i-1];
    }
    return reverse;
}