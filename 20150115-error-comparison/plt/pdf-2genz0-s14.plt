set terminal pdf
set output "../pdf/2genz0-s14.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/2genz0-s14.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s14-m08m23-2genz0.csv" w l title "NX sequence"
