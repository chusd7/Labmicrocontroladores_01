#include <stdlib.h>
#include <stdio.h>
//#include </usr/local/share/sdcc/non-free/includepic14/pic12f675.h>
#include </usr/local/share/sdcc/non-free/include/pic14/pic12f683.h>
//#include <xc.h>
#define S3 GP0
#define S2 GP1
#define S1 GP2
#define S0 GP4




typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);  // WDT y MCLR OFF

unsigned int lfsr = 0xACE1u; // valor inicial del lfsr

struct Numero_total {
  int Unid;
  int Decen;
};

/************************FUNCIONES*************************/

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

//se inicializan los valores binarios del bcd
const unsigned char SEGMENT_VALUES[10] = {
    0b00111111, // 0
    0b00000110, // 1
    0b01011011, // 2
    0b01001111, // 3
    0b01100110, // 4
    0b01101101, // 5
    0b01111101, // 6
    0b00000111, // 7
    0b01111111, // 8
    0b01101111  // 9
};


//Funcion que calcula un numero aleatorio con lfsr y returna un struct que contiene las unidades y decenas separadas
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


void display_numberd(int d) {

    // Desplegar las decenas
    S0 = ((SEGMENT_VALUES[d] >> 0) & 1);
    S1 = ((SEGMENT_VALUES[d] >> 1) & 1);
    S2 = ((SEGMENT_VALUES[d] >> 2) & 1);
    S3 = ((SEGMENT_VALUES[d] >> 3) & 1);


}
void display_numberu(int u){

    // Desplegar las decenas
    S0 = ((SEGMENT_VALUES[u] >> 0) & 1);
    S1 = ((SEGMENT_VALUES[u] >> 1) & 1);
    S2 = ((SEGMENT_VALUES[u] >> 2) & 1);
    S3 = ((SEGMENT_VALUES[u] >> 3) & 1);


}
void turn_off_display() {
  // Set all segments to off
  S0 = ((SEGMENT_VALUES[0] >> 0) & 1);
  S1 = ((SEGMENT_VALUES[0] >> 1) & 1);
  S2 = ((SEGMENT_VALUES[0] >> 2) & 1);
  S3 = ((SEGMENT_VALUES[0] >> 3) & 1);
  delay(1);
  GP5 = ~GP5;
  S0 = ((SEGMENT_VALUES[0] >> 0) & 1);
  S1 = ((SEGMENT_VALUES[0] >> 1) & 1);
  S2 = ((SEGMENT_VALUES[0] >> 2) & 1);
  S3 = ((SEGMENT_VALUES[0] >> 3) & 1);
  delay(1);
  GP5 = ~GP5;

}

void main(void) {
    TRISIO = 0b00001000 ; // Se configura gp3 como entrada los demas como salidas
    ANSEL = 0b00001000; // Set GP3 as digital input
    CMCON0 = 0x07; //Se apagan los comparadores
    GPIO = 0x00; //Inicializan todos los pines en 0 
    S0 = 0;
    S1 = 0;
    S2 = 0;
    S3 = 0;
    int i = 0;                  //Inicializa el contador de bolas
    struct Numero_total* n;




    while(1) {
        if (i==0 && GP3==1){
            n->Unid=0;
            n->Decen=0;
            display_numberu(n->Unid);
            delay(10);
            GP5 = ~GP5;
            display_numberd(n->Decen);
            delay(10);
            GP5 = ~GP5; 
        }
        display_numberu(n->Unid);
        delay(10);
        GP5 = ~GP5;
        display_numberd(n->Decen);
        delay(10);
        GP5 = ~GP5; 
        
        

        if (GP3 == 0) {  // Check if GP3 is low (button pressed)
            if(i<=16){
            //codigo para verificar si el numero est� dentro del registro
            //usar una funcion para ver si el numero calculado est� en el registro,salida booleana
            //guardar_imprimir();
                n=numero_aleatorio();
                i++;
            }
            else{
                turn_off_display();
                //GP5=1;
                //codigo para poner la pantalla parpadeando en 99,vaciar los registros
                //i=20;

            }

        }
        
    }
}
            /*if(n->Unid == 0){
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
            i++;*/







