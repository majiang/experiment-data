set terminal pdf
set output "../pdf/1genz2-s04.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz2-s04.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s04-m08m23-1genz2.csv" w l title "NX sequence"
