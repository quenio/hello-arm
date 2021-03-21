.PHONY: clean build run

clean:
	rm -f boot.o
	rm -f boot.out
	rm -f boot.bin
	rm -f boot.img
	ls -l

build: clean
	arm-none-eabi-as \
		-march=armv7-a -mcpu=cortex-a15 -g \
		-o boot.o boot.s
	arm-none-eabi-ld \
		-o boot.out \
		-T link.ld \
		-nostdlib \
		boot.o
	arm-none-eabi-objcopy boot.out boot.bin
	mkimage -A arm -O linux -T kernel \
		-a 0x0082000000 -e 0x0082000000 \
		-C none -d boot.bin boot.img
	ls -l

run: build
	export DISPLAY=0:
	sudo qemu-system-arm \
		-M vexpress-a15 -cpu cortex-a15 \
		-m size=1024 -kernel boot.img \
		-nographic -curses

