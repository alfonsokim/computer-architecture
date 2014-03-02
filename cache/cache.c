
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
void sumaEnIncrementos(double *arreglo, long tamArreglo, double factor) {

    long N = 100;           // invocar la rutina desde 100 hasta el tamanio del arreglo
    long salto = N * factor;// aqui guardo el incremento a c de cada iteracion

    clock_t inicio, fin;    // "para cada valor de N (calculado con el factor)
                            // mida el tiempo que toma hacer las R llamadas a
                            // la funcion suma"
    
    for(; N <= tamArreglo; N += salto) {        // "multiplicar el valor por una constante" 
        inicio = clock();
        long suma = sumaInvertida(arreglo, N);  // r llamadas a la funcion suma
        fin = clock();
        double tiempoMS = ((double)(fin - inicio) / CLOCKS_PER_SEC * 1000);
        double bytesSumados = (N-1) * sizeof(double) / (1024);
        printf("N=%i, t=%f ms, KB=%f\n", N, tiempoMS, bytesSumados);
    }

}

// ************************************************************************
// ************************************************************************
int main() {

    srand( time(NULL) );

    // printf("tam double %d\n", sizeof(double)); // 8 Bytes :)

    long tamArreglo = 1000000; //FIXME: No funciona con 10000000 :(
    double arreglo[tamArreglo];

    long c; // llenar el arreglo
    for(c = 0; c < tamArreglo; c++) {
        arreglo[c] = ( (double)rand() / (double)RAND_MAX );
    }

    sumaEnIncrementos(arreglo, tamArreglo, 1.5);

    return 0;
}

