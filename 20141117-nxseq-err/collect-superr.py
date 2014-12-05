from sys import argv, stderr
from os.path import join

def get_sup_err(line):
	from math import log
	buf = line.strip().split(',')
	m = int(buf[0].split()[1])
	err = max(map(lambda x: abs(float(x)), buf[-1024:]))
	return '%d,%.15f\n' % (m, log(err, 2))

if __name__ == '__main__':
	for genz_class in range(6):
		for genz_coef in [1, 2, 4]:
#			if genz_class == 4:
#				genz_coef *= 10
			for s in range(4, 17):
				file_name = 's%02d-m%02dm%02d-%dgenz%d.csv' % (s, 8, 23, genz_coef, genz_class)
				try:
					out_file = open(join('.', 'sup-err', file_name), 'w')
					for line in open(join('.', file_name)):
						out_file.write(get_sup_err(line))
				except:
					print 'processing "%s" failed!' % file_name
#				else:
#					print 'done.'
