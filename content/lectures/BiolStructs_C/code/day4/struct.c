#include <stdio.h>

struct site_data {
    char  name[256];
    float latitude;
    float longitude;
    int   accuracy;
    int   elevation;
};

void set_coords(struct site_data *site, float lat, float longit)
{
    (*site).latitude = lat;
    site->latitude = lat; // Equivalent to above
    site->longitude = longit;
}

int main(void)
{
    // Declaring individual structs
    struct site_data site1 = {0};
    struct site_data site2 = {0};
    struct site_data sites[100] = {0};

    site1.latitude = 72.00;
    site1.longitude = 0.0;

    set_coords(&site2, 100.0, 21.8);
    set_coords(&sites[3], 10.0, 12.1); 

    sites[10].latitude = 41.8;
    sites[10].longitude = -98.1;
    sites[10].elevation = 1823;
    sites[10].accuracy = 3;

    return 0;
}
