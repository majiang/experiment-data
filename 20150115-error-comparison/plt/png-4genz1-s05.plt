set terminal png
set output "../png/4genz1-s05.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz1-s05.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s05-m08m23-4genz1.csv" w l title "NX sequence"
