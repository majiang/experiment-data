set terminal png
set output "../png/1genz2-s06.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz2-s06.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s06-m08m23-1genz2.csv" w l title "NX sequence"
