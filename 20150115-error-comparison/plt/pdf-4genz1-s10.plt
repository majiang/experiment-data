set terminal pdf
set output "../pdf/4genz1-s10.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/4genz1-s10.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s10-m08m23-4genz1.csv" w l title "NX sequence"
