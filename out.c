#include <stdio.h>

extern int ARRAY_B[];

void PrintArrayB(int size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("%d ", ARRAY_B[i]);
    }
}