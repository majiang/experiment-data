set terminal png
set output "../png/2genz3-s13.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/2genz3-s13.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s13-m08m23-2genz3.csv" w l title "NX sequence"
