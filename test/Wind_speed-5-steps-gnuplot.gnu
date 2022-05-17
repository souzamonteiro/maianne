set encoding utf8
set term postscript eps enhanced color

set output 'Wind_speed-5-steps.eps'

set xlabel 'Event'
set ylabel 'Speed (m/s)'

set style line 1 lt 1 lw 1
set style line 2 lt 2 lw 1

plot 'Wind_speed-5-steps-test-out-denormalized.csv' using 1 title 'Real' with lines ls 1,\
     'Wind_speed-5-steps-ann-trained-output-denormalized.csv' using 1 title 'Simulation' with lines ls 2;

exit

