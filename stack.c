#include <stdlib.h>
#include "assert.h"
#include "stack.h"
 


 /** Tupla (elemento,puntero a otra tupla) */
struct _bstack_t{
        stack_elem_t value;
        bstack_t next;
};

struct _stack_t{
    bstack_t st;
    unsigned int size;
};


stack_t stack_empty() {
    stack_t empty = calloc(1,sizeof(struct _stack_t));
    empty->st = NULL;
    empty->size = 0u;
    return empty;
}

stack_t stack_push(stack_t s, stack_elem_t elem) {
    bstack_t new_elem = NULL;
    new_elem = calloc(1,sizeof(struct _bstack_t));
    new_elem->value = elem;
    new_elem->next = s->st;
    s->st = new_elem;
    s->size++;
    return s;
}

stack_t stack_pop(stack_t s){
    assert(s->size!=0);
    bstack_t c= NULL;
    c = s->st;
    s->st = c->next;
    free(c);
    s->size--;
    return s;
}

unsigned int stack_size(stack_t s) {
    return s->size;
}

stack_elem_t stack_top(stack_t s) {
    assert(stack_size(s));
    stack_elem_t result;
    result = s->st->value;
    return result;
}

bool stack_is_empty(stack_t s) {
    bool res=false;
    res = (stack_size(s) == 0);
    return res ;
}

stack_elem_t *stack_to_array(stack_t s) {
    if (stack_size(s) == 0) {
        return NULL;
    }
    unsigned int n = (stack_size(s));
    bstack_t c;
    stack_elem_t *array;
    array = calloc(n+1,sizeof(stack_elem_t));
    c = s->st;
    for (int i=n-1;i>=0;--i) {
        array[i] = c->value;
        c = c->next;  
    }
    return array;
}

stack_t stack_destroy(stack_t s){
    while (stack_size(s)!=0){
        s = stack_pop(s);    
    }    
    free(s);
    return NULL;
}