from sys import argv

n = int(argv[2])

outs = [open(argv[1][:-4] + '-' + str(i) + argv[1][-4:], 'w') for i in range(n)]

i = 0
for line in open(argv[1]):
	outs[i].write(line)
	i = (i + 1) % n
