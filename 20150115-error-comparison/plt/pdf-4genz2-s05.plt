set terminal pdf
set output "../pdf/4genz2-s05.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz2-s05.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s05-m08m23-4genz2.csv" w l title "NX sequence"
