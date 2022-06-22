CC = gcc -v -std=c99 \
	-Wall -Wextra -Werror -fomit-frame-pointer \
	-Wno-unused-function -D_DEFAULT_SOURCE -O2
SYSLIBS = -lm
OURLIB = -ltaurus
LDPATH = -L../lib
ALIB = libtaurus.a
SOLIB = libtaurus.so
ALIB32 = libtaurus32.a
SOLIB32 = libtaurus32.so


all: lib


########################################################################################
# native
########################################################################################

taurus.o: taurus.c
	$(CC) $(CFLAGS) -c $< -o $@ $(SYSLIBS)


lib.a: taurus.o
	ar rcs $(ALIB) $<
	@mv $(ALIB) ../lib/


lib.so: taurus.o
	$(CC) $(CFLAGS) -shared -Wl,-soname,$(SOLIB) -o $(SOLIB) $<
	@mv $(SOLIB) ../lib/


static: lib.a
	$(CC) $(CFLAGS) -static main.c $(LDPATH) $(OURLIB) -o donut_static $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_static
	@mv donut_static ../bin/


shared: lib.so
	$(CC) $(CFLAGS) -no-pie -fno-pie main.c -o donut_shared $(LDPATH) $(OURLIB) $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_shared
	@echo "compiled with '-no-pie -fno-pie', end a shared object without that."
	@echo "\n===========================================\n"
	LD_LIBRARY_PATH=../lib ldd donut_shared
	@mv donut_shared ../bin/

#########################################################################################
# 32bit
#########################################################################################

taurus32.o: taurus.c
	$(CC) $(CFLAGS) -m32 -c $< -o $@ $(SYSLIBS)


lib32.a: taurus32.o
	ar rcs --target=elf32-i386 $(ALIB32) $<
	@mv $(ALIB32) ../lib/


lib32.so: taurus32.o
	$(CC) $(CFLAGS) -m32 -shared -Wl,-soname,$(SOLIB32) -o $(SOLIB32) $<
	@mv $(SOLIB32) ../lib/


static32: lib32.a
	$(CC) $(CFLAGS) -m32 -static main.c $(LDPATH) $(OURLIB)32 -o donut_static32 $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_static32
	@mv donut_static32 ../bin/


shared32: lib32.so
	$(CC) $(CFLAGS) -m32 main.c -o donut_shared32 $(LDPATH) $(OURLIB)32 $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_shared32
	@echo "\n===========================================\n"
	LD_LIBRARY_PATH=../lib ldd donut_shared32
	@mv donut_shared32 ../bin/


clean:
	@rm -rvf *.o ../lib/* ../bin/*
