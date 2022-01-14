#include <stdio.h>

int main(void)
{
    signed char   schar; // "signed" isn't needed, but just for clarity
    unsigned char uchar;
    
    signed char sres;
    unsigned char ures;

    schar = 255; // in binary: 11111111
    uchar = 255; // in binary: 11111111

    printf("%i\n", schar);
    printf("%u\n", uchar);
    
    sres = schar << ((char)8);
    printf("%i\n", sres);
    ures = uchar << ((char)8);
    printf("%u\n", ures);

    sres = schar >> ((char)8);
    printf("%i\n", sres);
    ures = uchar >> ((char)8);
    printf("%u\n", ures);

    return 0;
}
