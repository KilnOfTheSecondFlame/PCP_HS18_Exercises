#include <stdio.h>

void printNumbersGoto(int number) {
	int counter = 0;
	start:
	printf("%i ", counter);
	counter++;
	if (counter<number+1) goto start;
}

void printNumbersFor(int number) {
	for (int counter = 0; counter < number+1; counter++) {
		printf("%i ", counter);
	}
}

void printNumbersRecursiveFunction(int number) {
	int counter = number;
	if (number > 0) printNumbersRecursiveFunction(--counter);
	printf("%i ", number);
}

int main(int argc, char const *argv[]) {
	printNumbersGoto(7);
	printf("= printNumbersGoto(7)\n");
	printNumbersFor(7);
	printf("= printNumbersFor(7)\n");
	printNumbersRecursiveFunction(7);
	printf("= printNumbersRecursiveFunction(7)\n");
	return 0;
}