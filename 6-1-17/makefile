clean:
	rm *.o a.out
0:1.o
	gcc 0.c 1.o 2.o 3.o
1.o:2.o
	gcc -c 1.c 2.o
2.o:3.o
	gcc -c 2.c 3.o
3.o:
	gcc -c 3.c
