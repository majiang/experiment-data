set terminal pdf
set output "../pdf/1genz3-s08.pdf"
set datafile separator ","
plot "../../20141022-dynamic/sup-err/1genz3-s08.csv" title "optimized", "../../20141117-nxseq-err/sup-err/s08-m08m23-1genz3.csv" w l title "NX sequence"
