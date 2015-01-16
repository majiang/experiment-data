set terminal png
set output "../png/4genz4-s15.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/40genz4-s15.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s15-m08m23-4genz4.csv" w l title "NX sequence"
