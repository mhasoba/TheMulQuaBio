#include <stdio.h>
#include <stdlib.h>

#include "calc.h"

int do_operation(float a, float b, char operator)
{
    if (operator == '+') {
        printf("%f\n", add_float(a, b));
        return 0;
    }
    if (operator == '-') {
        printf("%f\n", sub_float(a, b));
        return 0;
    }
    if (operator == 'x') {
        printf("%f\n", mult_float(a, b));
        return 0;
    }
    if (operator == '/') {
        printf("%f\n", div_float(a, b));
        return 0;
    }

    printf("Operator: %c not recognized!\n", operator);
    return 1;
}

int main(int argc, char *argv[])
{
    int ret = 1;
    float op1, op2;
    char operator;
    // This program is a calculator that
    // will take three inputs (arguments) 
    // from the user:
    // 1. An operand
    // 2. An operator
    // 3. An operand
    
    if (argc == 4) {
        // Number of inputs checks out
        op1 = atof(argv[1]);
        op2 = atof(argv[3]);

        operator = argv[2][0];

        ret = do_operation(op1, op2, operator);

    } else if (argc == 1) {
        printf("This is a calculator program written by: \n \
                Martin Brazeau\n \
                It takes three command line arguments. The usage is:\n \
                ./progname number operator number\n");
        ret = 0;
    }

    return ret;
}
