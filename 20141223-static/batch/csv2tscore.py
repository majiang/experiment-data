from os.path import join, basename
from glob import glob

script = join('..', '..', '20141022-dynamic', 'batch', 'linear.py')
in_path = join('..', 'results')
out_path = join('..', 'tscore')

for file_name in glob(join(in_path, '*.csv')):
	print 'python %s < %s > %s' % (script, file_name, join(out_path, basename(file_name)))
