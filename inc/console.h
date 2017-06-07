/*
 * Console header.
 */


#ifndef __CONSOLE_H__
#define __CONSOLE_H__


#include "stm32l0xx_hal.h"
#include "stm32_hal_legacy.h"
#include "stm32l0xx_hal_usart.h"
#include "stm32l0xx_hal_uart.h"
#include "stm32l0xx_hal_uart_ex.h"
#include "stm32l0xx_hal_gpio.h"

// /* Private function prototypes -----------------------------------------------*/
#ifdef __GNUC__
//  With GCC/RAISONANCE, small printf (option LD Linker->Libraries->Small printf
//  set to 'Yes') calls __io_putchar() 
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

void console_gpio_init(void);
void console_usart_init(void);
void HAL_UARTEx_WakeupCallback(UART_HandleTypeDef *huart);

// class Console {

// public: 
// 	Console();

// private: 
// 	int a; 
// 	int b; 

// };

#endif
