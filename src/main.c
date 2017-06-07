/*******************************
 * stm32 minimal example main.c
 *******************************/
#include <stdio.h>
#include <stdlib.h>
#include "console.h"

void delay(unsigned long);

int main()
{
    console_gpio_init();
    console_usart_init();

    while(1) 
    {
        printf("Bonjour");
        delay(200000);
    }

}
 
void delay(unsigned long count)
{
    while(count--);
}





