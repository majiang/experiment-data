from os.path import join

for s in range(4, 17):
	for m0 in range(8, 31):
		print s, m0,
		buf = []
		for line in open(join('..', 'result', 's%02d-%02dm.csv' % (s, m0))):
			buf.append(line.split()[1])
		if len(buf) % 10:
			print 'remainder'
		else:
			print ' '.join(buf[::10])
