from os.path import join

def only_m_w(line):
    return "%s,%s\n" % (line.strip().split()[1], line.strip().split(',')[2])

mmin, mmax = 8, 18
for s in range(4, 17):
    from_files = [open(join('..', 'good', 's%d-m%d-c1.csv' % (s, m))) for m in range(mmin, mmax)]
    to_file = open(join('..', 'good-concat', 's%02d-m%02d-m%02d-c1.csv' % (s, mmin, mmax)), 'w')
    for f in from_files:
        to_file.write(only_m_w(f.readlines()[9]))
