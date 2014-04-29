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
        long num_its = num_steps / omp_get_num_threads();
        step = 1.0 / (double)num_steps;
        int tid = omp_get_thread_num();
        
        long start_it = tid * num_its;
        
        printf("tid: %d num_its: %d start_it: %d\n", tid, num_its, start_it);

        //#pragma omp for // reduction(+:sum)
        #pragma omp for private(i, x) // reduction(+:sum)
        //for(i = start_it; i < (start_it + num_its); i++)
        for (i = 0; i < num_steps; i++) 
        {
            x = (i + 0.5) * step;
            //temp = temp + 4.0 / (1.0 + x*x);
            sum = sum + 4.0 / (1.0 + x*x);
        }
        //sum += temp;
        printf("Sum desde thread %d: %f\n", tid, sum);

    }

    printf("Sum desde afuera: %f\n", sum);

    pi = sum*step;
    stop = clock();

    printf("El valor calculado de Pi es: %15.12f\n",pi);
    printf("El tiempo requerido para calcular Pi fue %f milisegundos\n",((double)(stop - start)/1000.0));
    return 0;

}