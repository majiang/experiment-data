from os.path import join

n, v = 32, 4
p, q = 1000, 10
x = 10

for m in range(8, 32):
	for s in range(4, 17):
		print 'python collect-results.py %d %s > %s' % (
			q,
			' '.join(join('..', 'pointsets', 's%02d-m%02d-n%02d-%d.csv' % (s, m, n, i)) for i in range(x)),
			join('..', 'pointsets', 's%02d-m%02d-n%02d.csv' % (s, m, n))
			)
