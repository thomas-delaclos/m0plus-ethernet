
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
CP = arm-none-eabi-objcopy

HAL_SRC_DIR = ./lib/ext/HAL/src
CMSIS_SRC_DIR = ./lib/ext/CMSIS

CRT_DIR = /Users/magnum/opt/gcc-arm-none-eabi-6-2017-q1-update/arm-none-eabi/lib

OBJECT_FILES =  out/stm32l0xx_hal_cortex.o out/system_stm32l0xx.o out/stm32l0xx_hal_uart.o out/main.o out/startup_stm32l073xx.o out/console.o out/stm32l0xx_hal_usart.o  out/stm32l0xx_hal_gpio.o out/stm32l0xx_hal_rcc.o out/stm32l0xx_hal.o out/stm32l0xx_hal_dma.o 
# out/stm32l0xx_hal_uart.o

LKR_SCRIPT = ./scripts/linker_stm32l073xx.ld
#LKR_SCRIPT = ./scripts/linkerscript.ld
 
CFLAGS  = -c -fno-common -O0 -g -mcpu=cortex-m0plus -mthumb -Wall
LFLAGS  = -nostartfiles -T$(LKR_SCRIPT) --specs=nosys.specs
CPFLAGS =  -Obinary

INCLUDES = -I./inc/  -I./lib/ext -I./lib/ext/CMSIS -I./lib/ext/HAL/inc -I./lib/ext/HAL/inc/legacy -L lib

#all: program.bin

out/program.bin: out/program.elf 
	$(CP) $(CPFLAGS) $< $@ 

out/program.elf: $(OBJECT_FILES)
	$(CC) $(LFLAGS) $(INCLUDES) -o $@ $^

out/main.o: src/main.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/console.o: src/console.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/startup_stm32l073xx.o: startup_stm32l073xx.s
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_usart.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_usart.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_uart.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_uart.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

# out/stm32l0xx_hal_uart_ex.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_uart_ex.c
# 	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_gpio.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_gpio.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_rcc.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_rcc.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_dma.o:  $(HAL_SRC_DIR)/stm32l0xx_hal_dma.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal.o:  $(HAL_SRC_DIR)/stm32l0xx_hal.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/system_stm32l0xx.o: $(CMSIS_SRC_DIR)/system_stm32l0xx.c 
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

out/stm32l0xx_hal_cortex.o: $(HAL_SRC_DIR)/stm32l0xx_hal_cortex.c 
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	rm -rf out/*.o out/*.elf out/*.bin
