
#include "console.h"



#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

// Console::Console() {
//   a = 1; 
//   b = 2; 
// }








static UART_HandleTypeDef UartHandle;

void HAL_UARTEx_WakeupCallback(UART_HandleTypeDef *huart) {}

void console_gpio_init(void){

	GPIO_InitTypeDef  GPIO_InitStruct;

	 __HAL_RCC_GPIOA_CLK_ENABLE();  

	/* UART GPIO pin configuration  */

	GPIO_InitStruct.Pin       = GPIO_PIN_2 | GPIO_PIN_3;
	GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull      = GPIO_PULLUP;
	GPIO_InitStruct.Speed     = GPIO_SPEED_FREQ_VERY_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF4_USART2;

	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}


void console_usart_init(void){
	 
	 __HAL_RCC_USART2_CLK_ENABLE(); 

  /* Configure the UART peripheral */
  UartHandle.Instance        = USART2;
  UartHandle.Init.BaudRate   = 9600;
  UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
  UartHandle.Init.StopBits   = UART_STOPBITS_1;
  UartHandle.Init.Parity     = UART_PARITY_NONE;
  UartHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
  UartHandle.Init.Mode       = UART_MODE_TX_RX;


  if (HAL_UART_Init(&UartHandle) != HAL_OK)
  {
    /* Initialization Error */
    //Error_Handler();
  }
  
}



PUTCHAR_PROTOTYPE
{
  HAL_UART_Transmit(&UartHandle, (uint8_t *)&ch, 1, 0xFFFF);

  return ch;
}

