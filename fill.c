#include <stdio.h>

extern int ARRAY_A[];

void InputArrayA(int size) {
    int i, value;
    for (i = 0; i < size; i++) {
        scanf("%d", &value);
        ARRAY_A[i] = value;
    }
}