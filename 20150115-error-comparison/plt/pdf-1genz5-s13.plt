set terminal pdf
set output "../pdf/1genz5-s13.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz5-s13.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s13-m08m23-1genz5.csv" w l title "NX sequence"
