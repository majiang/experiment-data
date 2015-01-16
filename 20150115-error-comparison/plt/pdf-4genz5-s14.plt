set terminal pdf
set output "../pdf/4genz5-s14.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz5-s14.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s14-m08m23-4genz5.csv" w l title "NX sequence"
