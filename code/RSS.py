import os
import time
from datetime import datetime

def parse_smaps(pid):
    smaps_path = f"/proc/{pid}/smaps"
    if not os.path.exists(smaps_path):
        print(f"No such file: {smaps_path}")
        return

    segments = {}
    with open(smaps_path, 'r') as file:
        current_segment = None
        for line in file:
            if '-' in line:
                if current_segment:
                    segments[current_segment['start_end']] = current_segment
                # 开始新的段
                current_segment = {
                    'start_end': line.strip().split()[0] + " " + line.strip().split()[-1],
                    'Size': 0,
                    'Rss': 0,
                    'Pss': 0
                }
            elif line.startswith('Size:'):
                parts = line.split()
                current_segment['Size'] = int(parts[1])
            elif line.startswith('Rss:'):
                # 提取 Rss 值
                parts = line.split()
                current_segment['Rss'] = int(parts[1])
            elif line.startswith('Pss:'):
                # 提取 Pss 值
                parts = line.split()
                current_segment['Pss'] = int(parts[1])

        # 最后一个段
        if current_segment:
            segments[current_segment['start_end']] = current_segment

    return segments


def compare_and_report(new_segments, old_segments):
    current_time = datetime.now().strftime("%H:%M:%S")
    new_all_rss = 0
    old_all_rss = 0
    for value in new_segments.values():
        new_all_rss += int(value["Rss"])
    for value in old_segments.values():
        old_all_rss += int(value["Rss"])

    output = ""
    for segment, data in new_segments.items():
        if segment in old_segments:
            old_data = old_segments[segment]

            seg_output = ""
            if data['Size'] > old_data['Size']:
                seg_output += f"  Size increased from {old_data['Size']} KB to {data['Size']} KB\n"
            if data['Rss'] > old_data['Rss']:
                seg_output += f"  RSS increased from {old_data['Rss']} KB to {data['Rss']} KB\n"
            if data['Pss'] > old_data['Pss']:
                seg_output += f"  PSS increased from {old_data['Pss']} KB to {data['Pss']} KB\n"

            if seg_output != "":
                output += f"{segment}\n"
                output += f"{seg_output}\n"
        else:
            output += f"[new seg] {segment}\n"
            output += f"  Size increased from 0 KB to {data['Size']} KB\n"
            output += f"  RSS increased from 0 KB to {data['Rss']} KB\n"
            output += f"  PSS increased from 0 KB to {data['Pss']} KB\n"

    if output != "":
        print("===========================\n>>> {} All RSS from {} to {}\n".
              format(current_time, old_all_rss, new_all_rss))
        print(output)


def monitor_segments(pid):
    old_segments = None
    try:
        while True:
            new_segments = parse_smaps(pid)
            if old_segments:
                compare_and_report(new_segments, old_segments)
            old_segments = new_segments
            time.sleep(1)
    except KeyboardInterrupt:
        print("Monitoring stopped.")

if __name__ == "__main__":
    pid = 2992405
    # parse_smaps(pid)
    monitor_segments(pid)