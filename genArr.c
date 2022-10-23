extern int ARRAY_A[];
extern int ARRAY_B[];

void GenerateNewArray(int size) {
    int i, j = 0;
    for (i = 0; i < size; i++) {
        if (ARRAY_A[i] % 2 == 0 && ARRAY_A[i] < 0) {
            ARRAY_B[j] = ARRAY_A[i];
            j++;
        }
    }
}