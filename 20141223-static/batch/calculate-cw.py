from os.path import join

def pointset(s, m):
	if m <= 22:
		return join('..', '..', '20141022-dynamic', 'pointsets', 's%02d-m%02d-n%02d.csv' % (s, m, 32))
	else:
		return join('..', '..', '20141105-larger', 'pointsets', 's%02d-m%02d-n%02d.csv' % (s, m, 32))

def cvalue(s, m):
	return open(pointset(s, m)).readline().strip().split(',')[1]

def target(s, m0):
	return join('..', 'result', 's%02d-%02dm.csv' % (s, m0))


# reset
for m0 in range(8, 31):
	for s in range(4, 17):
		print 'copy dummy.csv %s' % target(s, m0)

for m in range(8, 31):
	for s in range(4, 17):
		for m0 in range(8, 31):
			try:
				c = cvalue(s, m0)
			except:
				print 'skip(%d, %d)' % (s, m0)
				continue
			print '%s %s < %s >> %s' % (
				join('..', 'executable', 'calculate-cw.exe'),
				c,
				pointset(s, m),
				target(s, m0)
			)
