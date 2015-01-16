set terminal png
set output "../png/4genz5-s09.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz5-s09.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s09-m08m23-4genz5.csv" w l title "NX sequence"
