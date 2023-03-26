#include <stdlib.h>
#include <time.h>

unsigned int lfsr = 0xACE1u; // valor inicial del lfsr

int numero_aleatorio() {
    unsigned int bit;
    // se cambia el lfsr y se hace el cambio del bit
    bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;
    // se cambia el lfsr con el bit anterior
    lfsr = (lfsr >> 1) | (bit << 15);

    // se usa el modulo de 100 al lfrs ya que se ocupa un numero entre 00 y 99
    return (lfsr % 100);
}


int main() {




    return 0;
}
