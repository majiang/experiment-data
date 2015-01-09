import glob

def towc(l):
	from collections import defaultdict
	d = defaultdict(int)
	for e in l:
		d[e] = d[e] + 1
	return sorted((k, v) for (k, v) in d.iteritems())

for fn in glob.glob('*.csv'):
	m = sorted(line.strip().split()[1] for line in open(fn))
	if towc(m) == [('27', 10), ('28', 10), ('29', 10), ('30', 10)]:
		continue #print 'git add', fn
	else:
		print '%s: %s' % (fn, str(towc(m)))
