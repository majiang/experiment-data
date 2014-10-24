from os.path import join

for m in range(8, 23):
	for s in range(4, 17):
		for i in range(6):
			for c in [2]:
				print '%s %s %s %s' % (
	join('..', 'executable', 'genz-err.exe'),
	join('..', 'pointsets', 's%02d-m%02d-n32.csv' % (s, m)),
	join('..', 'integrands', 'genz%d-s%02d-c%d-1024.ssv' % (i, s, c)),
	join('..', 'outputs', 'genz%d-s%02d-c%d-m%02d.csv' % (i, s, c, m)))
