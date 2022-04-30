#!/bin/sh

./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net
./bin/maianne.maia -i test/in-01.csv --its test/its-01.csv --ots test/ots-01.csv --ni 1 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net
