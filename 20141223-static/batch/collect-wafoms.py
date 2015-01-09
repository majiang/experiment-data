from os.path import join

def source(s, m0):
	return join('..', 'result-large', 's%02d-%02dm-large.csv' % (s, m0))

def target(s, m0):
	return join('..', 'results', 's%02d-%02dm.csv' % (s, m0))

for m0 in range(8, 31):
	for s in range(4, 17):
		t = open(target(s, m0), 'a')
		try:
			for line in open(source(s, m0)):
				buf = line.strip().split(',')
				m = buf[0].split()[1]
				lgw = buf[2]
				t.write('%s,%s\n' % (m, lgw))
		except:
			print 'skip(s%02d-%02dm)' % (s, m0)
