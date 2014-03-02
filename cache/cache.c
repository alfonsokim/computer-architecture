
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

// ************************************************************************
// ************************************************************************
double sumaInvertida(double *arreglo, long N) {
    
    double suma = 0;
    long c;
    for(c = N-1; c >= 0; c--){ // sumar los primeros n valores en orden inverso
        suma += arreglo[c];
    }

    return suma;
}

// ************************************************************************
// ************************************************************************
double sumaEnIncrementos(double *arreglo, long tamArreglo, double factor) {

    long N = 100; // invocar la rutina desde 100 hasta el tamanio del arreglo
    long operaciones = 0;
    long salto = N * factor; // aqui guardo el incremento a c de cada iteracion
    
    for(; N <= tamArreglo; N += salto) { // "multiplicar el valor por una constante" 
        long suma = sumaInvertida(arreglo, N);
        operaciones += N; // sumaInvertida hace N operaciones
    }
    printf("%d operaciones para factor=%f\n", operaciones, factor);
}

// ************************************************************************
// ************************************************************************
double prueba(double *arreglo, long tamArreglo, double factor) {

    clock_t startTime, endTime;
    startTime = clock();
    sumaEnIncrementos(arreglo, tamArreglo, factor);
    endTime = clock();
    double timeInMS = (double)(endTime - startTime) / CLOCKS_PER_SEC * 1000;
    // printf("Tiempo en sumar N elementos del arreglo: %f ms\n", (double)(endTime - startTime) / CLOCKS_PER_SEC * 1000);    
    // printf("Suma: %f\n", sum);


}

// ************************************************************************
// ************************************************************************
int main(){
    srand ( time(NULL) );

    long tamArreglo = 1000000;
    double arreglo[tamArreglo];

    long c; // llenar el arreglo
    for(c = 0; c < tamArreglo; c++) {
        arreglo[c] = ( (double)rand() / (double)RAND_MAX );
    }

    long N = 1000;
    long R = 1000;

    printf("tam double %f", sizeof(double));
    prueba(arreglo, tamArreglo, 1.2);

    return 0;
}

