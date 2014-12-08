def average(xs):
	return float(sum(xs)) / len(xs)

def rms(xs): # root mean square
	from math import sqrt
	return sqrt(average(x*x for x in xs))

def inp(xs, ys): # inner product
	return sum(x*y for (x, y) in zip(xs, ys))

def mmean(xs): # subtract mean from each
	m = average(xs)
	return [x - m for x in xs]

def stdev(xs): # standard deviation
	return sqrt(var(xs))

def stand(xs): # standardization
	xs = mmen(xs)
	sx = rms(xs)
	return [x / sx for x in xs]

def correl(xs, ys): # correlation coefficient
	n = len(xs)
	return inp(stand(xs), stand(ys)) / n

def covar(xs, ys): # covariance
	n = len(xs)
	return inp(mmean(xs), mmean(ys)) / n

def var(xs):
	return covar(xs, xs)

def residual(xs, ys, linear):
	a, b = linear
	return sum((a*x+b-y)**2 for (x, y) in zip(xs, ys))

def tscore(xs, ys, linear):
	from math import sqrt
	n = len(xs)
	a, b = linear
	return (a + 1) * sqrt(n * (n - 2) * var(xs) / residual(xs, ys, linear)), n-2

def lineareg(xs, ys): # linear regression
	a = covar(xs, ys) / var(xs)
	b = average(ys) - a*average(xs)
	return (a, b)

def proc(s, c, i):
	from os.path import join
	xs = []
	ys = []
	for line in open(join('..', 'sup-err', 's%02d-m08m23-%dgenz%d.csv' % (s, c, i))):
		buf = line.strip().split(',')
		xs.append(int(buf[0]))
		ys.append(float(buf[1]))
	linear = lineareg(xs, ys)
	open(join('..', 'tscore', 's%02d-m08m23-%dgenz%d.csv' % (s, c, i)), 'w').write(
		'%.8e,%.8e,%.8e,%d\n' % (linear + tscore(xs, ys, linear)))

def main():
	from sys import argv
	if len(argv) < 4:
		print 'process all'
		for s in range(4, 17):
			for c in [1, 2, 4]:
				for i in range(6):
					proc(s, c, i)
		print 'linear dim_R genz_c genz_i'
		return
	s, c, i = map(int, argv[1:])
	proc(s, c, i)

if __name__ == '__main__':
	main()
