#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

double **fillMatrix(int size)
{
    double **matrix = (double **)malloc(size * sizeof(double *));

    for (int i = 0; i <= size; i++){
        matrix[i] = (double *)malloc(size * sizeof(double));
    }

    for (int i=0; i<size; i++) {
        for(int j=0; j<size; j++){
            matrix[i][j] = rand();
        }
    }
    return matrix;
}

void freeMatrix(double **matrix, int size)
{
    for (int i = 0; i <= size; i++){
        free(matrix[i]);
    }

    free(matrix);
}

double *fillVector(int size)
{
    double *vector = (double *)malloc(size * sizeof(double *));

    for (int i = 0; i < size; i++) {
        vector[i] = rand();
    }

    return vector;
}

double *fillResultIJ(int size)
{
    double *resultIJ = (double *)malloc(size * sizeof(double *));

    for (int i = 0; i < size; i++) {
        resultIJ[i] = 0;
    }

    return resultIJ;
}

double *fillResultJI(int size)
{
    double *resultJI = (double *)malloc(size * sizeof(double *));

    for (int i = 0; i < size; i++) {
        resultJI[i] = 0;
    }

    return resultJI;
}

double *matrixVectorMultiplicationIJ(double **matrix, double *vector, double *result, int size)
{
    for (int i = 0; i <= size; i++) {
        for (int j = 0; j <= size; j++) {
            result[i] = result[i] + (matrix[i][j] * vector[j]);
        }
    }
    return result;
}

double *matrixVectorMultiplicationJI(double **matrix, double *vector, double *result, int size)
{
    for (int j = 0; j <= size; j++) {
        for (int i = 0; i <= size; i++) {
            result[i] = result[i] + (matrix[i][j] * vector[j]);
        }
    }
    return result;
}

int main(void)
{
    srand(time(NULL));
    FILE *ij, *ji;
    clock_t start_t, end_t;
    double total_t;
    int size;

    ij = fopen("../documents/c/csv/matrixVectorMultiplicationIJ.csv", "w+");
    ji = fopen("../documents/c/csv/matrixVectorMultiplicationJI.csv", "w+");

    for(int i=1;i<=6;i++)
    {
        size = 4500 * i;
        double **matrix = fillMatrix(size);
        double *vector = fillVector(size);

        double *resultIJ = fillResultIJ(size);
        start_t = clock();
        resultIJ = matrixVectorMultiplicationIJ(matrix, vector, resultIJ, size);
        end_t = clock();
        total_t = ((double)(end_t - start_t)) / CLOCKS_PER_SEC;
        printf("\nIt took the computer %.6f s, to compute a %d degree matrix on IJ; i = %d\n", total_t, size,i);
        fprintf(ij, "%d,%.6f\n", size, total_t);
        free(resultIJ);

        double *resultJI = fillResultJI(size);
        start_t = clock();
        resultJI = matrixVectorMultiplicationJI(matrix, vector, resultJI, size);
        end_t = clock();
        total_t = ((double)(end_t - start_t)) / CLOCKS_PER_SEC;
        printf("\nIt took the computer %.6f s, to compute a %d degree matrix on JI; i = %d\n", total_t, size,i);
        fprintf(ji, "%d,%.6f\n", size, total_t);
        free(resultJI);

        freeMatrix(matrix, size);
        free(vector);
    }

    fclose(ij);
    fclose(ji);

    return 0;
}