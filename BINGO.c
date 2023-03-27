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
//funcion que calcule un numero random y verifique si está en la memoria
/*

void guardar_imprimir(){
    bool a=true;
    while (a=true){
        n=numero_aleatorio();
        a=func(); //funcion para ver si a está en los registros
        if (a==false){
            funcion_escribir_imprimir();
        }
        else{

        }
    }




*/

void main(void) {
    //int TRISIObits.TRISIO3 = 0b1;     // Se configura gp3 como entrada
    //int TRISIObits.TRISIO4 = 0b0;     // Se configura gp3 como entrada
    //int OPTION_REGbits.nGPPU = 0b0;   // Enable internal pull-up resistors
    int i = 0;                  //Inicializa el contador de bolas
    int numero_bingo = 0;
    srand((unsigned) time(NULL));

    while(1) {
        //if (GPIObits.GP3 == 0) {  // Check if GP3 is low (button pressed)
            if(i<=16){
                //numero_bingo=numero_aleatorio();
                //codigo para verificar si el numero está dentro del registro
                //usar una funcion para ver si el numero calculado está en el registro,salida booleana
                //while el numero este repetido

            }
            else{
                //codigo para poner la pantalla parpadeando en 99,vaciar los registros e inicializar i a 0
            }
        //}
        //else{

        //}
    }
}
/*
    int rand_num;

    // set the initial seed value based on current time
    srand((unsigned) time(NULL));

    // generate one random number between 00 to 99
    rand_num = random_number();

    // print the generated random number
    printf("%02d\n", rand_num);


*/
