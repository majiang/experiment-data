from os.path import join

def only_m_w(line):
    return "%s,%s\n" % (line.strip().split()[1], line.strip().split(',')[2])

mmin, mmax = 8, 23

c = 1

for s in range(4, 17):
    from_files = [open(join('..', 'good', 's%d-m%d-c%d.csv' % (s, m, c))) for m in range(mmin, mmax)]
    to_file = open(join('..', 'good-concat', 's%02d-m%02d-m%02d-c%d.csv' % (s, mmin, mmax, c)), 'w')
    for f in from_files:
        to_file.write(only_m_w(f.readlines()[9]))

for s in range(4, 17):
    from_files = [open(join('..', 'all', 's%d-m%d-c%d.csv' % (s, m, c))) for m in range(mmin, mmax)]
    to_file = open(join('..', 'all-concat', 's%02d-m%02d-m%02d-c%d.csv' % (s, mmin, mmax, c)), 'w')
    for f in from_files:
        to_file.write(''.join(map(only_m_w, f.readlines())))

for s in range(4, 17):
    open(join('..', 'plt', 'png-c%d-s%02d.plt' % (c, s)), 'w').write(
        open(join('.', 'png.plt-template')).read() % (
            c, s, c, s, mmin, mmax, c, s, c))
    open(join('..', 'plt', 'pdf-c%d-s%02d.plt' % (c, s)), 'w').write(
        open(join('.', 'pdf.plt-template')).read() % (
            c, s, c, s, mmin, mmax, c, s, c))
