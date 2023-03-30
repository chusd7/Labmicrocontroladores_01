#include <stdlib.h>
#include <stdio.h>
//#include <pic14/pic12f675.h>
#include </usr/local/share/sdcc/non-free/include/pic14/pic12f683.h>
//#include <xc.h>
#define Boton GP3
/*#define BCD_0 GP0
#define BCD_1 GP1
#define BCD_2 GP2
#define BCD_3 GP5
#define BCD_0 GP5
#define BCD_1 GP2
#define BCD_2 GP1
#define BCD_3 GP0
#define DISP_NEG GP4*/



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

struct Numero_total* numero_aleatorio() {
    struct Numero_total numero;
    int aux = 0 ;
    unsigned int bit;
    // se cambia el lfsr y se hace el cambio del bit
    bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;
    // se cambia el lfsr con el bit anterior
    lfsr = (lfsr >> 1) | (bit << 15);

    // se usa el modulo de 100 al lfrs ya que se ocupa un numero entre 00 y 99
    aux=lfsr % 100;
    //printf("num1 = %d",aux);
    numero.Unid = aux % 10;
    numero.Decen = (aux / 10) % 10;
    return &numero;
}



void main(void) {
    TRISIO = 0b00001000 ; // Se configura gp3 como entrada los demas como salidas
    ANSEL = 0; //Todas las entradas se dejan como digitales
    CMCON0 = 0x07; //Se apagan los comparadores
    GPIO = 0x00; //Inicializan todos los pines en 0 
    /*int TRISIObits.TRISIO2 = 0b0;     // Se configura gp4 como salida
    int TRISIObits.TRISIO5 = 0b0;     // Se configura gp4 como salida
    int TRISIObits.TRISIO6 = 0b0;     // Se configura gp4 como salida
    int TRISIObits.TRISIO7 = 0b0;     // Se configura gp4 como salida
    int TRISIObits.TRISIO3 = 0b1;     // Se configura gp3 como entrada
    int TRISIObits.TRISIO4 = 0b0;     // Se configura gp4 como salida*/
    int i = 0;                  //Inicializa el contador de bolas
    //srand((unsigned) time(NULL));
    //printf("num1 = %d, num2 = %d\n", n.Decen, n.Unid);


    while(1) {
        if (boton == 0) {  // Check if GP3 is low (button pressed)
            if(i<=16){
                //codigo para verificar si el numero está dentro del registro
                //usar una funcion para ver si el numero calculado está en el registro,salida booleana
                //guardar_imprimir();
                struct Numero_total* n=numero_aleatorio();
                if(n->Unid == 0){
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }

                if(n->Unid == 1){
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n->Unid == 2){
                    bit0 = 0;
                    bit1 = 1;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n->Unid == 3){
                    bit0 = 1;
                    bit1 = 1;
                    bit2 = 0;
                    bit3 = 0;
                    continue;
                }
                if(n->Unid == 4)
                {
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }
                if(n->Unid == 5)
                {
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }
                if(n->Unid == 6)
                {
                    bit0 = 0;
                    bit1 = 1;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }

                if (n->Unid == 7){
                    bit0 = 1;
                    bit1 = 1;
                    bit2 = 1;
                    bit3 = 0;
                    continue;
                }

                if (n->Unid == 8){
                    bit0 = 0;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 1;
                    continue;
                }

                if (n->Unid == 9){
                    bit0 = 1;
                    bit1 = 0;
                    bit2 = 0;
                    bit3 = 1;
                    continue;
                }
                if(n->Decen == 0){
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }

                if(n->Decen == 1){
                    bit4 = 1;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n->Decen == 2){
                    bit4 = 0;
                    bit5 = 1;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n->Decen == 3){
                    bit4 = 1;
                    bit5 = 1;
                    bit6 = 0;
                    bit7 = 0;
                    continue;
                }
                if(n->Decen == 4)
                {
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }
                if(n->Decen == 5)
                {
                    bit4 = 1;
                    bit5 = 0;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }
                if(n->Decen == 6)
                {
                    bit4 = 0;
                    bit5 = 1;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }

                if (n->Decen == 7){
                    bit4 = 1;
                    bit5 = 1;
                    bit6 = 1;
                    bit7 = 0;
                    continue;
                }

                if (n->Decen == 8){
                    bit4 = 0;
                    bit5 = 0;
                    bit6 = 0;
                    bit7 = 1;
                    continue;
                }

                if (n->Decen == 9){
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

                delay(100);
                GP5 = ~GP5;

                GP0 = bit4;
                GP1 = bit5;
                GP2 = bit6;
                GP4 = bit7;
                i++;


            }
            else{
                //codigo para poner la pantalla parpadeando en 99,vaciar los registros
                //printf("se acabo el bingo");
                //i=20;

            }

    }
    }
}
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}


