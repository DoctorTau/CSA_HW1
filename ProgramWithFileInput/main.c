#include <stdio.h>

int ARRAY_A[10485];
int ARRAY_B[10485];

int main(int argc, char **argv) {
    int i, n, new_size = 0;
    // First 2 argv are names of input and output files
    if (argc < 3 || argc > 3)
        printf("Invalid input");

    // Read from file.
    FILE *input = fopen(argv[1], "r");
    FILE *output = fopen(argv[2], "w");

    fscanf(input, "%d", &n);
    for (i = 0; i < n; i++) {
        fscanf(input, "%d", &ARRAY_A[i]);
        if (ARRAY_A[i] % 2 == 0 && ARRAY_A[i] < 0) {
            new_size++;
        }
    }
    for (i = 0; i < n; i++) {
        if (ARRAY_A[i] % 2 == 0 && ARRAY_A[i] < 0) {
            fprintf(output, "%d ", ARRAY_A[i]);
        }
    }

    fclose(input);
    fclose(output);
    return 0;
}
