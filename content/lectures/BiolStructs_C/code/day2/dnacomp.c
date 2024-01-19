#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <limits.h>

/*
 * Compare 2 DNA sequences:
 *
 * Sequence 1: AAGTC
 * Sequence 2: TAGCC
 *
 * One way to represent it:           A, C, G, T
 * unsigned int seq1_position_0[] = { 1, 0, 0, 0};
 * unsigned int seq2_position_0[] = { 0, 0, 0, 1};
 * unsigned int anc__position_0[] = { 1, 0, 0, 1};
 *
 * Or choose the following convention:
 * A: 0001: 0x01
 * C: 0010: 0x02
 * G: 0100: 0x04
 * T: 1000: 0x08
 * -: 1111: 0xF
 * ?: 1111: 0xF
 *
 * */
uint8_t A = 0x01, C = 0x02, G = 0x04, T = 0x08;

uint8_t lookup[UCHAR_MAX] = {0};

void populate_lookup(void)
{
    //memset(lookup, 0, UCHAR_MAX);
    lookup['a'] = lookup['A'] = 0x01;
    lookup['c'] = lookup['C'] = 0x02;
    lookup['g'] = lookup['G'] = 0x04;
    lookup['t'] = lookup['T'] = 0x08;
}

// This is the type of data that would come from a
// user or external source:
char usrseq1[] = "aagtc";
char usrseq2[] = "tagcc";

void convert_dna_input
(uint8_t dest[], const char src[], const int seqlen)
{
    int i;

    for (i = 0; i < seqlen; ++i) {
        dest[i] = lookup[src[i]];
    }
}

int main(void)
{
    int i, seqmax = 5;
    uint8_t seq1[seqmax];
    uint8_t seq2[seqmax];
    uint8_t anc[seqmax];

    populate_lookup();
    
    // Populate our sequence buffers
    convert_dna_input(seq1, usrseq1, seqmax);
    convert_dna_input(seq2, usrseq2, seqmax);

    // Unordered
    for (i = 0; i < seqmax; ++i) { 
        anc[i] = seq1[i] & seq2[i];
        if (anc[i] == 0) {
            anc[i] = seq1[i] | seq2[i];
        }
    }

    return 0;
}

