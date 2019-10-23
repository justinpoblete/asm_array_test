#!/bin/bash



#Justin Poblete jpoblete4@csu.fullerton.edu



rm *.o
rm *.out
rm *.lis

echo "Assemble call.asm"
nasm -f elf64 -l call.lis -o call.o call.asm

echo "Compile fill.cpp"
g++ -c -Wall -m64 -std=c++14 -o fill.o -fno-pie -no-pie fill.cpp

echo "Compile main.cpp"
g++ -c -Wall -m64 -std=c++14 -o main.o -fno-pie -no-pie main.cpp

echo "Link all object files"
g++ -m64 -std=c++14 -fno-pie -no-pie fill.o call.o main.o -o test.out

echo "Now the program will run"
./test.out
