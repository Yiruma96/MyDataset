#include <stdint.h>
#include <stdio.h>

typedef uint8_t u8;

void rotate_nonzero_elements(u8* chunk) {
    u8 last_tag = 0;
    u8 prev_tag = 0;
    int first_ele = -1;

    u8 cur_chunk;
    for (int i=0; i<255; i++) {
        cur_chunk = chunk[i];
        if (cur_chunk != 0){
            if (first_ele == -1){
                first_ele = i;
            } else{
                chunk[i] = prev_tag;
            }
            prev_tag = cur_chunk;
            last_tag = cur_chunk;
        }
    }
    chunk[first_ele] = last_tag;
}

int main() {
    u8 chunk[255] = {0};
//    for (int i=0; i<255; i++) {
//        chunk[i] = i+1;
//    }
    chunk[1] = 233;
//    chunk[254] = 0;

    printf("Before rotation:\n");
    for (int i = 0; i < 255; i++) {
        if (chunk[i] != 0) {
            printf("chunk[%d] = %d\n", i, chunk[i]);
        }
    }

    rotate_nonzero_elements(chunk);

    printf("After rotation:\n");
    for (int i = 0; i < 255; i++) {
        if (chunk[i] != 0) {
            printf("chunk[%d] = %d\n", i, chunk[i]);
        }
    }

    return 0;
}
