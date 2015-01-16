set terminal pdf
set output "../pdf/4genz4-s13.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/40genz4-s13.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s13-m08m23-4genz4.csv" w l title "NX sequence"
