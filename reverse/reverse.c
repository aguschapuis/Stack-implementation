#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../stack.h"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: ./reverse <string-to-reverse>\n");
        exit(EXIT_FAILURE);
    }
    char *str = argv[1];
    int length = strlen(str);
    stack_t s = stack_empty();
    char *str2=(char*)calloc(length+1,sizeof(char));
    for (int i=0;i<length;++i){
        s = stack_push(s,str[i]);
    }
    for (int i = 0;i<length; i++){
        str2[i] = stack_top(s);
        s = stack_pop(s);
    }
    s=stack_destroy(s);
    printf("%s\n", str2);
    free(str2);
    /*
    for (int i=length-1;i>=0;--i){
        s = stack_push(s,str[i]);
    }
    str = stack_to_array(s);
    s=stack_destroy(s);
    printf("%s\n",str);  
    free(str);
    */
    
    /* Completar */

}
