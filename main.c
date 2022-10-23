#include <stdio.h>

int ARRAY_A[10485];
int ARRAY_B[10485];

extern void InputArrayA(int size);

extern void PrintArrayB(int size);

extern void GenerateNewArray(int size);

int main(int argc, char** argv) {
    int i, n, new_size = 0;

    scanf("%d", &n);
    InputArrayA(n);
    for (i = 0; i < n; i++) {
        if (ARRAY_A[i] % 2 == 0 && ARRAY_A[i] < 0) {
            new_size++;
        }
    }
    GenerateNewArray(n);
    PrintArrayB(new_size);

    return 0;
}
