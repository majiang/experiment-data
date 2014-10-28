from os.path import join, basename
from glob import glob


in_path = join('..', 'sup-err')
out_path = join('..', 'proc-out')

for file_name in glob(join(in_path, '*.csv')):
	print 'python linear.py < %s > %s' % (file_name, join(out_path, basename(file_name)))
