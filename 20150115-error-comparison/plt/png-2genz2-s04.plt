set terminal png
set output "../png/2genz2-s04.png"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/2genz2-s04.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s04-m08m23-2genz2.csv" w l title "NX sequence"
