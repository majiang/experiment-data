set terminal pdf
set output "../pdf/1genz0-s06.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz0-s06.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s06-m08m23-1genz0.csv" w l title "NX sequence"
