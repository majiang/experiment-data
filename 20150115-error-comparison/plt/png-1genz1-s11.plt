set terminal png
set output "../png/1genz1-s11.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz1-s11.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s11-m08m23-1genz1.csv" w l title "NX sequence"
