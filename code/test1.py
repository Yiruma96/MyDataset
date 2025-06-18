from sortedcontainers import IntervalTree

def parse_maps_file(maps_file_path):
    memory_intervals = IntervalTree()
    with open(maps_file_path, 'r') as f:
        for line in f:
            parts = line.split()
            start, end = map(int, parts[0].split('-'), base=16)
            memory_intervals[start:end] = line.strip()
    return memory_intervals

# 示例用法
maps_file_path = 'your_maps_file_path'
intervals_tree = parse_maps_file(maps_file_path)