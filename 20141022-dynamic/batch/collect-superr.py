from sys import argv, stderr
from os.path import join

def get_sup_err(line):
	from math import log
	buf = line.strip().split(',')
	m = int(buf[0].split()[1])
	err = max(map(lambda x: abs(float(x)), buf[-1024:]))
	return '%d,%.15f\n' % (m, log(err, 2))

if __name__ == '__main__':
	for genz_coef in [1, 2, 4]:
		for genz_class in range(6):
			for s in range(4, 17):
				out_file = open(
					join('..', 'sup-err', '%dgenz%d-s%02d.csv' % (genz_coef, genz_class, s)),
					'w')
				for m in range(8, 23):
					try:
						in_file_name = join('..', 'outputs', 'genz%d-s%02d-c%d-m%02d.csv' % (genz_class, s, genz_coef, m))
						stderr.write(in_file_name + '\n')
						in_file = open(in_file_name)
					except:
						stderr.write('error!\n')
						continue
					for line in in_file:
						out_file.write(get_sup_err(line))
