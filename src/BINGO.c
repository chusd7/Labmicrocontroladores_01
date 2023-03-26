#include <stdlib.h>
#include <time.h>

unsigned int lfsr = 0xACE1u; // initial seed value

int random_number() {
    unsigned int bit;

    // shift the LFSR and get the output bit
    bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;

    // update the LFSR with the output bit
    lfsr = (lfsr >> 1) | (bit << 15);

    // map the LFSR output value to the range 0-99
    return (lfsr % 100);
}

int main() {
    int rand_num;

    // set the initial seed value based on current time
    srand((unsigned) time(NULL));

    // generate one random number between 00 to 99
    rand_num = random_number();

    // print the generated random number
    printf("%02d\n", rand_num);

    return 0;
}
