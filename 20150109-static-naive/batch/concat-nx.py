from os.path import join

def only_m_w(line):
    return "%s,%s\n" % (line.strip().split()[1], line.strip().split(',')[2])

for s in range(4, 17):
    to_file = open(join('..', 'nx', 's%02d-c1.csv' % s), 'w')
    for line in open(join('..', 'nx', 'nx-s%02d.csv' % s)):
        to_file.write(only_m_w(line))
