all: main.bin

main.o: main.S 
	arm-none-eabi-as -mthumb -o main.o main.S -g

main.elf: main.o
	arm-none-eabi-ld -Ttext 0x0000000 main.o -o main.elf 
   
main.bin: main.elf 
	arm-none-eabi-objcopy -S -O binary main.elf main.bin
	arm-none-eabi-size main.elf

flash: main.bin
	(echo "flash write_image main.bin"; echo "quit") | telnet host.docker.internal 4444

debug: main.elf
	gdb-multiarch -iex "set auto-load safe-path ." ./main.elf

clean: 
	rm main.elf main.o main.bin
