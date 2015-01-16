set terminal pdf
set output "../pdf/4genz0-s15.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz0-s15.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s15-m08m23-4genz0.csv" w l title "NX sequence"
