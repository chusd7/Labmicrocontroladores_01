#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>
//#include <pic14/pic12f675.h>
#include <pic14/pic12f683.h>
//#include <xc.h>
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);  // WDT y MCLR OFF

void delay (unsigned int tiempo);
int bit0;
int bit1;
int bit2;
int bit3;
int bit4;
int bit5;
int bit6;
int bit7;
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


/*
bool isNumberRepeated(unsigned char num) {
    unsigned char i, j;
    unsigned char data[128]; // asumiendo memoria en PIC12F683 de 128 bytes

    // leer la memoria
    for(i = 0; i < 128; i++) {
        data[i] = _data_read(i);
    }

    // revisa si el numero está repetido
    for(i = 0; i < 128; i++) {
        for(j = i + 1; j < 128; j++) {
            if(data[i] == data[j] && data[i] == num) {
                return true; // numero repetido
            }
        }
    }

    return false; // numero no repetido
}




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
*/

void main(void) {
    //int TRISIObits.TRISIO3 = 0b1;     // Se configura gp3 como entrada
    //int TRISIObits.TRISIO4 = 0b0;     // Se configura gp4 como salida
    int i = 0;                  //Inicializa el contador de bolas
    srand((unsigned) time(NULL));
    GPIO = 0x00; //Poner pines en bajo
    //printf("num1 = %d, num2 = %d\n", n.Decen, n.Unid);


    while(1) {
        //if (GPIObits.GP3 == 0) {  // Check if GP3 is low (button pressed)
            if(i<=16){
                //codigo para verificar si el numero está dentro del registro
                //usar una funcion para ver si el numero calculado está en el registro,salida booleana
                //guardar_imprimir();
                struct Numero_total n;
                n=numero_aleatorio();
                if(n.Unid == 0){
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }

                if(n.Unid == 1){
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n.Unid == 2){
                    bit0 = 0;
                    bit1 = 1;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n.Unid == 3){
                    bit0 = 1;
                    bit1 = 1;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n.Unid == 4)
                {
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }
                if(n.Unid == 5)
                {
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }
                if(n.Unid == 6)
                {
                    bit0 = 0;
                    bit1 = 1;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }

                if (n.Unid == 7){
                    bit0 = 1;
                    bit1 = 1;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }

                if (n.Unid == 8){
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 1;
                    continue;
                }

                if (n.Unid == 9){
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 1;
                    continue;
                }
                if(n.Decen == 0){
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }

                if(n.Decen == 1){
                    bit4 = 1;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n.Decen == 2){
                    bit4 = 0;
                    bit5 = 1;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n.Decen == 3){
                    bit4 = 1;
                    bit5 = 1;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n.Decen == 4)
                {
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }
                if(n.Decen == 5)
                {
                    bit4 = 1;
                    bit5 = 0;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }
                if(n.Decen == 6)
                {
                    bit4 = 0;
                    bit5 = 1;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }

                if (n.Decen == 7){
                    bit4 = 1;
                    bit5 = 1;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }

                if (n.Decen == 8){
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 1;
                    continue;
                }

                if (n.Decen == 9){
                    bit4 = 1;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 1;
                    continue;
                }
                GP5 = ~GP5;

                GP0 = bit0;
                GP1 = bit1;
                GP2 = bit2;
                GP4 = bit3;

                delay(10);
                GP5 = ~GP5;

                GP0 = bit4;
                GP1 = bit5;
                GP2 = bit6;
                GP4 = bit7;
                i++;


            }
            else{
                //codigo para poner la pantalla parpadeando en 99,vaciar los registros
                printf("se acabo el bingo");
                //i=20;

            }

    }

};
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}


