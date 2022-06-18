CC = gcc
CFLAGS = -std=c99 \
		 -Wall -Wextra -Werror -fomit-frame-pointer \
		 -Wno-unused-function -D_DEFAULT_SOURCE
SYSLIBS = -lm
OURLIB = -ltaurus
LDPATH = -L../lib
ALIB = libtaurus.a
SOLIB = libtaurus.so


all: lib


taurus.o: taurus.c
	$(CC) $(CFLAGS) -c $< -o $@ $(SYSLIBS)


static:
	$(CC) $(CFLAGS) -static main.c $(LDPATH) $(OURLIB) -o donut_static $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_static
	@mv donut_static ../bin/


shared:
	$(CC) $(CFLAGS) -no-pie -fno-pie main.c -o donut_shared $(LDPATH) $(OURLIB) $(SYSLIBS)
	@echo "\n===========================================\n"
	@file donut_shared
	@echo "compiled with '-no-pie -fno-pie', end a shared object without that."
	@echo "\n===========================================\n"
	LD_LIBRARY_PATH=../lib ldd donut_shared
	@mv donut_shared ../bin/


lib: taurus.o
	ar rcs $(ALIB) $<
	$(CC) $(CFLAGS) -c taurus.c -o $<
	$(CC) $(CFLAGS) -shared -Wl,-soname,$(SOLIB) -o $(SOLIB) $<
	@mv $(ALIB) $(SOLIB) ../lib/


clean:
	@rm -rvf *.o ../lib/* ../bin/*
