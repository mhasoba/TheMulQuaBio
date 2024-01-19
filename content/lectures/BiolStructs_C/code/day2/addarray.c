int main(void)
{
    int arr1[5];
    int arr2[5];
    int arr3[5];

    // Summing arrays:
    int i;
    for (i = 0; i < 5; ++i) {
        arr3[i] = arr1[i] + arr2[i];
    }

    int arr4[10];
    // Concatonate arrays
    for (i = 0; i < 5; ++i) {
        arr4[i] = arr1[i]
    }
    int j;
    for ( j = 0; i < 10; ++i, ++j) {
        arr4[i] = arr1[j];
    }

    return 0;
}
