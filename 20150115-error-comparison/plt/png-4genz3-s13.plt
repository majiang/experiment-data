set terminal png
set output "../png/4genz3-s13.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz3-s13.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s13-m08m23-4genz3.csv" w l title "NX sequence"
