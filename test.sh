#!/bin/sh

#./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net
./bin/maianne.maia --its test/its-01.csv --ots test/ots-01.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net
./bin/maianne.maia -i test/in-01.csv --ni 1 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" test/mlp-trained.net

#./bin/maianne.maia --normalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature.csv
#./bin/maianne.maia --denormalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized.csv --minimum 8.1 --maximum 34.8
#./bin/maianne.maia --split --nfirst 1000 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized.csv
#./bin/maianne.maia --split --nfirst 700 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-700.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-301.csv
#./bin/maianne.maia --replace "" --with 0 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation.csv
#./bin/maianne.maia --normalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced.csv
#./bin/maianne.maia --denormalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized.csv --minimum 0 --maximum 4135.8
#./bin/maianne.maia --split --nfirst 1000 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized.csv
#./bin/maianne.maia --split --nfirst 700 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-700.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-301.csv
#./bin/maianne.maia --normalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed.csv
#./bin/maianne.maia --denormalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized.csv --minimum 0.1 --maximum 6.5
#./bin/maianne.maia --split --nfirst 1000 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized.csv
#./bin/maianne.maia --split --nfirst 700 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-700.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-301.csv
#./bin/maianne.maia --column 8 -i "test/BRASILIA_A001_2021-06-01_2021-12-31.csv"

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/Temperature-ann.net
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-700-steps.csv > test/Temperature-train-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-700.csv > test/Temperature-train-out.csv
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-301-steps.csv > test/Temperature-test-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-301.csv > test/Temperature-test-out.csv
#./bin/maianne.maia --ann test/Temperature-ann.net --its test/Temperature-train-in.csv --ots test/Temperature-train-out.csv --lrate 0.005 --loops --prepare --nw --epochs 2000 --interval 100 --af tanh --oaf linear --of none --ofc "[1,0]"