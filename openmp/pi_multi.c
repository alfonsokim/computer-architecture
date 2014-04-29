#include <stdio.h>
#include <time.h>

long long num_steps = 1000000000;
double step;

int main(int argc, char* argv[])
{
    clock_t start, stop;

    double x, pi, sum = 0.0;

    long i;
    long start_it, temp = 0;
    start = clock();

    #pragma omp parallel private(i, x) reduction(+:sum)
    {   
        step = 1.0 / (double)num_steps;
        
        #pragma omp for private(i, x) // reduction(+:sum)
        for (i = 0; i < num_steps; i++) 
        {
            x = (i + 0.5) * step;
            sum = sum + 4.0 / (1.0 + x*x);
        }
    }

    pi = sum*step;
    stop = clock();

    printf("El valor calculado de Pi es: %15.12f\n",pi);
    printf("El tiempo requerido para calcular Pi fue %f milisegundos\n",((double)(stop - start)/1000.0));
    return 0;

}