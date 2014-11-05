from os.path import join

n, v = 32, 4
p, q = 1000, 10
x = 10

for i in range(x):
	optimization_batch = open('%02d.bat' % i, 'w')
	for m in range(8, 32):
		for s in range(4, 17):
			optimization_batch.write('%s %d %d %d %d %d %d > %s\n' % (
				join('..', 'executable', 'dynamic-optimization.exe'),
				s, m, n, v, p // x, q,
				join('..', 'pointsets', 's%02d-m%02d-n%02d-%d.csv' % (s, m, n, i))
			))
