CC = gcc
CFLAGS = -W -Wall -pedantic -g

SRCDIR = ./src
BUILDIR = ./build
OBJDIR = ./obj

SRC = main.c

build: $(OBJDIR)/main.o $(OBJDIR)/io.o $(OBJDIR)/insert.o
	@echo "\nBuilding main program\n"
	$(CC) -o ./build/insurance-reg $(OBJDIR)/main.o $(OBJDIR)/io.o $(OBJDIR)/insert.o -g
	@echo "\nBuild completed!\n"

$(OBJDIR)/main.o:	$(SRCDIR)/${SRC}
	$(CC) -o $(OBJDIR)/main.o -c $(SRCDIR)/$(SRC) $(CFLAGS)

$(OBJDIR)/io.o: $(SRCDIR)/io.c $(SRCDIR)/headers/io.h
	$(CC) -o $(OBJDIR)/io.o -c $(SRCDIR)/io.c $(CFLAGS)

$(OBJDIR)/insert.o: $(SRCDIR)/insert.c $(SRCDIR)/headers/insert.h
	$(CC) -o $(OBJDIR)/insert.o -c $(SRCDIR)/insert.c $(CFLAGS)

#TODO: make a decent clean

clean:
	rm -f ./obj/*.o	

clean-build:
	rm -f ./build/*

clean-all: clean clean-build
