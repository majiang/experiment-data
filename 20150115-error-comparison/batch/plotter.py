def nx(genz_i, genz_c, s):
	def join(*x):
		return '/'.join(list(x))

	return join('..', '..', '20141117-nxseq-err', 'sup-err',
		's%02d-m08m23-%dgenz%d.csv' % (s, genz_c, genz_i))

def op(genz_i, genz_c, s):
	def join(*x):
		return '/'.join(list(x))

	if genz_i == 4:
		genz_c *= 10
	return join('..', '..', '20141022-dynamic', 'sup-err',
		'%dgenz%d-s%02d.csv' % (genz_c, genz_i, s))

for i in range(6):
	for s in range(4, 17):
		for c in [1, 2, 4]:
			fn = "%dgenz%d-s%02d" % (c, i, s)
			for method in ['png', 'pdf']:
				from os.path import join
				open(join('..', 'plt', '%s-%s.plt' % (method, fn)), 'w').write(
					open(join('.', '%s.plt-template' % method)).read() % (
						method,
						method, fn, method,
						op(i, c, s), nx(i, c, s)
						))
