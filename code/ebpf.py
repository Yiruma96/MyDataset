#!/usr/bin/python3

from bcc import BPF
from time import strftime
from datetime import datetime

# 替换这个值为你想要监控的进程的 PID
target_pid = 2965410  # 例如：替换为实际进程ID

prog = f"""
#include <uapi/linux/ptrace.h>
#include <linux/mm_types.h>
#include <linux/timekeeping.h>

struct data_t {{
    u64 ts;
    unsigned long address;
}};

BPF_PERF_OUTPUT(events);

int kprobe__handle_mm_fault(struct pt_regs *ctx, struct vm_area_struct *vma, unsigned long address, unsigned int flags) {{
    if (bpf_get_current_pid_tgid() >> 32 == {target_pid}) {{
        struct data_t data = {{}};
        data.ts = bpf_ktime_get_ns() / 1000000000;  // 转换为秒
        data.address = address;
        events.perf_submit(ctx, &data, sizeof(data));
    }}
    return 0;
}}
"""

b = BPF(text=prog)


# 从BPF程序中获取perf事件
perf_events = b["events"]

# 打印每次页面错误的时间戳和地址
def print_event(cpu, data, size):
    event = b["events"].event(data)
    # 将秒数转换为时间结构
    time_struct = datetime.fromtimestamp(event.ts).timetuple()
    time_struct = strftime("%H:%M:%S", time_struct)
    print(f"Time: {time_struct}, Page fault at address: 0x{event.address:x}")

# 将事件与处理函数关联
b["events"].open_perf_buffer(print_event)

# 开始监听事件
while True:
    try:
        b.perf_buffer_poll()
    except KeyboardInterrupt:
        break