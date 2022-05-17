set encoding utf8
set term postscript eps enhanced color

set output 'Radiation.eps'

set xlabel 'Event'
set ylabel 'Radiation (KJ/m²)'

set style line 1 lt 1 lw 1
set style line 2 lt 2 lw 1

plot 'Radiation-test-out-denormalized.csv' using 1 title 'Real' with lines ls 1,\
     'Radiation-ann-trained-output-denormalized.csv' using 1 title 'Simulation' with lines ls 2;

exit

