set encoding utf8
set term postscript eps enhanced color

set output 'ETH-USD.eps'

set xlabel 'Event'
set ylabel 'Price (USD)'

set style line 1 lt 1 lw 1
set style line 2 lt 2 lw 1

plot 'ETH-USD-test-out-denormalized.csv' using 1 title 'Real' with lines ls 1,\
     'ETH-USD-ann-trained-output-denormalized.csv' using 1 title 'Simulation' with lines ls 2;

exit

