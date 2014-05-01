///////////////////////////////////////////////////////////////////////////////
//    Codigo adaptado de Intel (2005)
///////////////////////////////////////////////////////////////////////////////
//
// Argumentos:  Rango inicial, rango final
///////////////////////////////////////////////////////////////////////////////


//////////////////// Constantes y variables globales //////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>
#include <math.h>
static       int gProgress    = 0,
                 gPrimesFound = 0;   // Acumulador de nÃºmero de primos encontrados
long             globalPrimes[1000000000];  // Para almacenar los primos encontrados
int              CLstart, CLend;


///////////////////////////////////////////////////////////////////////////////
//
//  Imprime portcentaje de avance
//
///////////////////////////////////////////////////////////////////////////////

void ShowProgress( int val, int range )
{
    int percentDone = 0;
    
    gProgress++;
    
    percentDone = (int)((float)gProgress/(float)range *200.0f + 0.5f);
    
	if( percentDone % 10 == 0 ) {
        printf("\b\b\b\b%3d%%", percentDone);
    }
	
}

///////////////////////////////////////////////////////////////////////////////
//
//  Busca factores.  Devuelve "0" si los encuentra
//
///////////////////////////////////////////////////////////////////////////////

int TestForPrime(int val)
{
    int limit, factor = 3;
    
    limit = (long)( sqrtf( ( float )val ) + 0.5f );
    while( (factor <= limit) && (val % factor))
        factor ++;
    
    return (factor > limit);
}

void FindPrimes(int start, int end)
{
    // start siempre es non
    int i, range = end - start + 1;
    
    //#pragma omp parallel private(i)
    {

        #pragma omp for private(i)
        for( i = start; i <= end; i += 2 )
        {
            if( TestForPrime(i) ) {
                #pragma omp critical  
                {
                    globalPrimes[gPrimesFound++] = i;
                }
            }
            
            //ShowProgress(i, range);
        }

    }
}


int main(int argc, char **argv)
{
    int     start, end,i;
    //clock_t before, after;
    
    if( argc == 3 )
    {
        CLstart = atoi(argv[1]);
        CLend   = atoi(argv[2]);
    }
    else
    {
        printf("Uso:- %s <rango inicio> <rango fin>\n", argv[0]);
        exit(-1);
    }
    
    if (CLstart > CLend) {
        printf("Valor inicial debe ser menor o igual al valor final\n");
        exit(-1);
    }
    if (CLstart < 1 && CLend < 2) {
		printf("El rango de busqueda debe estar formado por enteros positivos\n");
		exit(-1);
    }
    start = CLstart;
    end = CLend;
    
    if (CLstart < 2)
        start = 2;
    if (start <= 2)
        globalPrimes[gPrimesFound++] = 2;
    
    if((start % 2) == 0 )
        start = start + 1;  // Asegurar que iniciamos con un numero impar
    

    long num_threads, end_num;
    for (num_threads = 2; num_threads < 10; num_threads += 2){
        for(end_num = 10000000; end_num < 10000000*10; end_num *= 2){

            start = 1;
            //end = end_num;
            omp_set_num_threads(num_threads);
            double t_start = omp_get_wtime();
            FindPrimes(start, end_num);
            double t_end = omp_get_wtime();

            printf("Primos=%d,Max=%d,Tiempo=%.2f,Hilos=%d\n",
            gPrimesFound, end_num, (t_end - t_start), num_threads);

            gPrimesFound = 0;
        }    
    }
    
}



