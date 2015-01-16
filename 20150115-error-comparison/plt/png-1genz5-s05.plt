set terminal png
set output "../png/1genz5-s05.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz5-s05.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s05-m08m23-1genz5.csv" w l title "NX sequence"
