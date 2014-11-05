from sys import argv

find_size = int(argv[1])
buf = []
for arg in argv[2:]:
	for line in open(arg):
		w = float(line.strip().split(',')[2])
		buf.append((w, line.strip()))
for w, line in sorted(buf)[:find_size]:
	print line
