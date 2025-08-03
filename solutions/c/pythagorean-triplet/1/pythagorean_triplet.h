#ifndef PYTHAGOREAN_TRIPLET_H
#define PYTHAGOREAN_TRIPLET_H
typedef struct triplets {
    int a;
    int b;
    int c;
} triplet_t;

typedef struct triplet_arr {
    triplet_t triplets[10];
    int count;
} triplets_t;

triplets_t* triplets_with_sum(int sum);

void free_triplets(triplets_t *t);

#endif
