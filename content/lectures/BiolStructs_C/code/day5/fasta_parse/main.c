#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>

typedef uint8_t nucleotide;

typedef struct matrix_t {
    int nseq;
    int seqlen;
    nucleotide** sequences;
} matrix_t;

uint8_t A = 0x01, C = 0x02, G = 0x04, T = 0x08;

uint8_t lookup[UCHAR_MAX] = {0};

void populate_lookup(void)
{
    //memset(lookup, 0, UCHAR_MAX);
    lookup['a'] = lookup['A'] = 0x01;
    lookup['c'] = lookup['C'] = 0x02;
    lookup['g'] = lookup['G'] = 0x04;
    lookup['t'] = lookup['T'] = 0x08;
    lookup['-'] = lookup['?'] = 0xFF;
}

matrix_t* new_matrix(int nseq, int seqlen)
{
    int i;
    // Skips checks for malloc success; do this yourself
    matrix_t* m;
    m = calloc(1, sizeof(matrix_t));
    m->sequences = calloc(nseq, sizeof(nucleotide *));
    for (i = 0; i < nseq; ++i) {
        m->sequences[i] = malloc(seqlen * sizeof(nucleotide));
    }
    m->nseq = nseq;
    m->seqlen = seqlen;

    return m;
}

void delete_matrix(matrix_t* m)
{
    int i;
    for (i = 0; i < m->nseq; ++i) {
        if (m->sequences[i] != NULL) {
            free(m->sequences[i]);
            m->sequences[i] = NULL;
        }
    }
    free(m->sequences);
    m->sequences = NULL;
    free(m);
}

int read_fasta(FILE* f)
{
    bool inseq = false;
    int nseq = 0, seqlen = 0, seqpos = 0, maxseqlen = 0;
    int maxlen = 0, len = 0;
    char c = '\0';
    while (c != EOF) {
        c = fgetc(f);
        ++len;
        if (c == '\n') {
            if (len > maxlen) {
                maxlen = len;
            }
            len = 0;
        }
    }

    char* linebuffer = calloc(maxlen, sizeof(char));
    if (linebuffer == NULL) {
        printf("Error: insufficient memory for file reading.\n");
        return -1;
    }

    rewind(f);
    while(fgets(linebuffer, maxlen, f)) {
        //printf("%s", linebuffer);
        char* t = linebuffer;
        while (isspace(*t) && *t != '\0') {
            ++t;
        }

        if (*t == '>') {
            // We are in the sequence header
            ++nseq;
            seqlen = 0;
        } else {
            t = linebuffer;
            while (*t != '\0' && *t != EOF) {
                if (isalnum(*t)) {
                    ++seqlen;
                    if (seqlen > maxseqlen) {
                        maxseqlen = seqlen;
                    }
                }
                ++t;
            }
        }

    }

    printf("nsequence: %i\n", nseq);
    printf("maxseqlen: %i\n", maxseqlen);

    matrix_t* m = new_matrix(nseq, maxseqlen);
    
    rewind(f);
    nseq = -1;
    while(fgets(linebuffer, maxlen, f)) {
        //printf("%s", linebuffer);
        char* t = linebuffer;
        // Skip leading whitespace
        while (isspace(*t) && *t != '\0') {
            ++t;
        }

        if (*t == '>') {
            // We are in the sequence header
            ++nseq;
            seqpos = 0;
        } else {
            t = linebuffer;
            while (*t != '\0' && *t != EOF) {
                if (lookup[*t]) {
                    m->sequences[nseq][seqpos] = lookup[*t];
                    ++seqpos;
                }
                ++t;
            }
        }
    }

    int i, j;
    for (i = 0; i < m->nseq; ++i) {
        for (j = 0; j < m->seqlen; ++j) {
            printf("%i ", m->sequences[i][j]);
        }
        printf("\n");
    }

    return 0;
}

//int main(int argc, char** argv)
int main(int argc, char* argv[])
{
    FILE* f;
    char* filename;

    populate_lookup();

    if (argc != 2) {
        printf("Error: program requires an input file.\n");
        return 0;
    }

    filename = argv[1];

    f = fopen(filename, "r");

    if (f == NULL) {
        printf("Error: unrecognized file name: %s\n", filename);
        return 0;
    }
    
    read_fasta(f);

    fclose(f);

    return 0;
}
