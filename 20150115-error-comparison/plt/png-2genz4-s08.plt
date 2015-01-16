set terminal png
set output "../png/2genz4-s08.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/20genz4-s08.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s08-m08m23-2genz4.csv" w l title "NX sequence"
