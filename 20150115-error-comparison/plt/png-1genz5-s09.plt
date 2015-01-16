set terminal png
set output "../png/1genz5-s09.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz5-s09.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s09-m08m23-1genz5.csv" w l title "NX sequence"
