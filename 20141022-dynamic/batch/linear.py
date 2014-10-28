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



if __name__ == '__main__':
	from sys import argv, stdin
	numys = 1
	if 1 < len(argv):
		numys = int(argv[1])
	xs = []
	yss = [[] for i in range(numys)]
	for line in stdin:
		buf = map(float, line.strip().split(','))
		xs.append(buf[0])
		for i, y in enumerate(buf[1:][:numys]):
			yss[i].append(y)
	for ys in yss:
		linear = lineareg(xs, ys)
		print "%.8e,%.8e,%.8e,%d" % (linear + tscore(xs, ys, linear)) # slope, , tscore, degree-freedom
else:
	from sys import argv
	if 1 < len(argv):
		from sys import stdin
		xs, ys = [], []
		for line in stdin:
			x, y = map(float, line.strip().split())
			xs.append(x)
			ys.append(y)
	else:
		xs, ys = [], []
		while True:
			try:
				x, y = map(float, raw_input().strip().split())
			except:
				break
			xs.append(x)
			ys.append(y)
	linear = lineareg(xs, ys)
	print linear, tscore(xs, ys, linear)
