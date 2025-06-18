#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include "stdint.h"
#include "stdlib.h"
#include "stdio.h"
#include "stdint.h"
#include <unistd.h>
#include "stdbool.h"


void main(){
    uint8_t pool_info[0x1000] = {0};

    uint64_t unmap_start = 0x1 << 30 + ;
    uint64_t temp_shadow_addr = unmap_start;
    uint64_t temp_region_id = region_id;
    while (true){
        if (*(u8*)((uint64_t)pool_info + 8 + temp_region_id) == 0){
            if (IsAligned(temp_shadow_addr, page_size_) == true)
                break;
            else{
                temp_shadow_addr -= region_size/16;
                temp_region_id -= 1;
            }
        } else
            break;
    }
    unmap_start = RoundUpTo(temp_shadow_addr, page_size_);
    // 从当前region开始搜索可释放的上边界
    uint64_t unmap_end   = HWASanUntaggedPointerToShadow((uint64_t)region_base + region_size);
    temp_shadow_addr = unmap_end;
    temp_region_id = region_id;
    while (true){
        if (*(u8*)((uint64_t)pool_info + 8 + temp_region_id) == 0){
            if (IsAligned(temp_shadow_addr, page_size_) == true)
                break;
            else{
                temp_shadow_addr += region_size/16;
                temp_region_id += 1;
            }
        } else
            break;
    }
    unmap_end = RoundDownTo(temp_shadow_addr, page_size_);
    // 准备释放
    if (unmap_end > unmap_start){
        HWASanFixedMapForced(unmap_start, unmap_end-unmap_start);
    }
}
}
