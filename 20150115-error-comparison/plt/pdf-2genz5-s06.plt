set terminal pdf
set output "../pdf/2genz5-s06.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/2genz5-s06.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s06-m08m23-2genz5.csv" w l title "NX sequence"
