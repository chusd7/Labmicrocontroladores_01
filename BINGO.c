#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>


unsigned int lfsr = 0xACE1u; // valor inicial del lfsr
struct Numero_total {
  int Unid;
  int Decen;
};

struct Numero_total numero_aleatorio() {
    struct Numero_total numero;
    int aux = 0 ;
    unsigned int bit;
    // se cambia el lfsr y se hace el cambio del bit
    bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;
    // se cambia el lfsr con el bit anterior
    lfsr = (lfsr >> 1) | (bit << 15);

    // se usa el modulo de 100 al lfrs ya que se ocupa un numero entre 00 y 99
    aux=lfsr % 100;
    printf("num1 = %d",aux);
    numero.Unid = aux % 10;
    numero.Decen = (aux / 10) % 10;
    return numero;
}

/*int isNumberRepeated(unsigned char num){
    unsigned char i, j;
    int b=0;
    unsigned char data[b]; // assuming data memory size of PIC12F683 is 64 bytes

    // read data memory into buffer
    for(i = 0; i < 64; i++)
    {
        data[i] = _data_read(i);
    }

    // check for repeated number
    for(i = 0; i < 64; i++)
    {
        for(j = i + 1; j < 64; j++)
        {
            if(data[i] == data[j] && data[i] == num)
            {
                return 1; // number is repeated
            }
        }
    }

    return 0; // number is not repeated
}
*/
//funcion para agregar un numero en los registros
//funcion para imprimir

void guardar_imprimir(){
    bool a=true;
    struct Numero_total n;
    while (a=true){
        //n=numero_aleatorio();
        //a=func(); //funcion para ver si a está en los registros
        if (a==false){
            //funcion_escribir_imprimir();
        }
        else{

        }
    }

}


void main(void) {
    //int TRISIObits.TRISIO3 = 0b1;     // Se configura gp3 como entrada
    //int TRISIObits.TRISIO4 = 0b0;     // Se configura gp4 como salida
    int i = 0;                  //Inicializa el contador de bolas
    int numero_bingo = 0;
    srand((unsigned) time(NULL));
    struct Numero_total n;
    n=numero_aleatorio();
    printf("num1 = %d, num2 = %d\n", n.Decen, n.Unid);


    /*while(1) {
        //if (GPIObits.GP3 == 0) {  // Check if GP3 is low (button pressed)
            if(i<=16){
                //codigo para verificar si el numero está dentro del registro
                //usar una funcion para ver si el numero calculado está en el registro,salida booleana
                //guardar_imprimir();
                //i++;

            }
            else{
                //codigo para poner la pantalla parpadeando en 99,vaciar los registros
                //i=0;
            }

    }*/
};


