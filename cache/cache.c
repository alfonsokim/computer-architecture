
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
double sumaNormal(double *arreglo, long N) {
    
    double suma = 0;
    long c;
    for(c = 0; c < N; c++){ // sumar los primeros n valores en orden natural del arreglo
        suma += arreglo[c];
    }

    return suma;
}

// ************************************************************************
// ************************************************************************
double sumaEnBloques2(double *arreglo, long N) {
    
    double suma = 0;
    long c;
    for(c = 0; c < N; c += 2){  // sumar los elementos en bloques de 2
        suma += (arreglo[c] + arreglo[c+1]);
    }

    return suma;
}

// ************************************************************************
// ************************************************************************
double sumaEnBloques4(double *arreglo, long N) {
    
    double suma = 0;
    long c;
    for(c = 0; c < N; c += 4){  // sumar los elementos en bloques de 4
        suma += (arreglo[c] + arreglo[c+1] + arreglo[c+2] + arreglo[c+3]);
    }

    return suma;
}

// ************************************************************************
// ************************************************************************
double sumaEnBloques8(double *arreglo, long N) {
    
    double suma = 0;
    long c;
    for(c = 0; c < N; c += 8){  // sumar los elementos en bloques de 8
        suma += (arreglo[c] + arreglo[c+1] + arreglo[c+2] + arreglo[c+3] + 
                 arreglo[c+4] + arreglo[c+5] + arreglo[c+6] + arreglo[c+7]);
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
        //long suma = sumaInvertida(arreglo, N);  // r llamadas a la funcion suma
        //long suma = sumaNormal(arreglo, N);
        //long suma = sumaEnBloques2(arreglo, N);
        //long suma = sumaEnBloques4(arreglo, N);
        long suma = sumaEnBloques8(arreglo, N);
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
    // const long tamArreglo = 10000000;
    static double arreglo[10000000];// Para que funcione con arreglo de tamanio
                                    // 10 000 000 hay que declarar el arreglo
                                    // estatico, y el tamanio no puede guardarse
                                    // en una variable.

    long c; // llenar el arreglo
    for(c = 0; c < 10000000; c++) {
        arreglo[c] = ( (double)rand() / (double)RAND_MAX );
    }

    sumaEnIncrementos(arreglo, tamArreglo, 1.5);

    return 0;
}

