set terminal png
set output "../png/1genz3-s09.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz3-s09.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s09-m08m23-1genz3.csv" w l title "NX sequence"
