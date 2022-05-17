#!/bin/sh

#
# Simple tests.
#

#./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net
#./bin/maianne.maia --its test/its-01.csv --ots test/ots-01.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net
#./bin/maianne.maia -i test/in-01.csv --ni 1 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/mlp-trained.net

#
# Weather prediction.
#

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

#./bin/maianne.maia --normalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction.csv
#./bin/maianne.maia --denormalize -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized.csv --minimum 1 --maximum 360
#./bin/maianne.maia --split --nfirst 1000 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized.csv
#./bin/maianne.maia --split --nfirst 700 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-700.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-301.csv

#./bin/maianne.maia --column 8 -i "test/BRASILIA_A001_2021-06-01_2021-12-31.csv"

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/Temperature-ann.net
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-700-steps.csv > test/Temperature-train-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-700.csv > test/Temperature-train-out.csv
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-301-steps.csv > test/Temperature-test-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Temperature-normalized-1000-301.csv > test/Temperature-test-out.csv
#./bin/maianne.maia --its test/Temperature-train-in.csv --ots test/Temperature-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/Temperature-ann.net
#./bin/maianne.maia -i test/Temperature-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/Temperature-ann-trained.net
#./bin/maianne.maia --denormalize -i test/Temperature-ann-trained-output.csv --minimum 8.1 --maximum 34.8
#./bin/maianne.maia --denormalize -i test/Temperature-test-out.csv --minimum 8.1 --maximum 34.8

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/Radiation-ann.net
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-700-steps.csv > test/Radiation-train-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-700.csv > test/Radiation-train-out.csv
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-301-steps.csv > test/Radiation-test-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Radiation-replaced-normalized-1000-301.csv > test/Radiation-test-out.csv
#./bin/maianne.maia --its test/Radiation-train-in.csv --ots test/Radiation-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/Radiation-ann.net
#./bin/maianne.maia -i test/Radiation-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/Radiation-ann-trained.net
#./bin/maianne.maia --denormalize -i test/Radiation-ann-trained-output.csv --minimum 0 --maximum 4135.8
#./bin/maianne.maia --denormalize -i test/Radiation-test-out.csv --minimum 0 --maximum 4135.8

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/Wind_speed-ann.net
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-700-steps.csv > test/Wind_speed-train-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-700.csv > test/Wind_speed-train-out.csv
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-301-steps.csv > test/Wind_speed-test-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_speed-normalized-1000-301.csv > test/Wind_speed-test-out.csv
#./bin/maianne.maia --its test/Wind_speed-train-in.csv --ots test/Wind_speed-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/Wind_speed-ann.net
#./bin/maianne.maia -i test/Wind_speed-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/Wind_speed-ann-trained.net
#./bin/maianne.maia --denormalize -i test/Wind_speed-ann-trained-output.csv --minimum 0.1 --maximum 6.5
#./bin/maianne.maia --denormalize -i test/Wind_speed-test-out.csv --minimum 0.1 --maximum 6.5

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/Wind_direction-ann.net
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-700-steps.csv > test/Wind_direction-train-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-700.csv > test/Wind_direction-train-out.csv
#sed '$ d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-301-steps.csv > test/Wind_direction-test-in.csv
#sed '1,5d' test/BRASILIA_A001_2021-06-01_2021-12-31-Wind_direction-normalized-1000-301.csv > test/Wind_direction-test-out.csv
#./bin/maianne.maia --its test/Wind_direction-train-in.csv --ots test/Wind_direction-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/Wind_direction-ann.net
#./bin/maianne.maia -i test/Wind_direction-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/Wind_direction-ann-trained.net
#./bin/maianne.maia --denormalize -i test/Wind_direction-ann-trained-output.csv --minimum 1 --maximum 360
#./bin/maianne.maia --denormalize -i test/Wind_direction-test-out.csv --minimum 1 --maximum 360

#
# Crypto price prediction.
#

#./bin/maianne.maia --column 4 -i "test/BTC-USD.csv"
#sed '1,1d' test/BTC-USD-column-4.csv > test/BTC-USD-Close.csv
#./bin/maianne.maia --normalize -i test/BTC-USD-Close.csv
#./bin/maianne.maia --denormalize -i test/BTC-USD-Close-normalized.csv --minimum 28936.355469 --maximum 67566.828125
#./bin/maianne.maia --split --nfirst 300 -i test/BTC-USD-Close-normalized.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BTC-USD-Close-normalized-300.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/BTC-USD-Close-normalized-67.csv

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/BTC-USD-ann.net
#sed '$ d' test/BTC-USD-Close-normalized-300-steps.csv > test/BTC-USD-train-in.csv
#sed '1,5d' test/BTC-USD-Close-normalized-300.csv > test/BTC-USD-train-out.csv
#sed '$ d' test/BTC-USD-Close-normalized-67-steps.csv > test/BTC-USD-test-in.csv
#sed '1,5d' test/BTC-USD-Close-normalized-67.csv > test/BTC-USD-test-out.csv
#./bin/maianne.maia --its test/BTC-USD-train-in.csv --ots test/BTC-USD-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/BTC-USD-ann.net
#./bin/maianne.maia -i test/BTC-USD-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/BTC-USD-ann-trained.net
#./bin/maianne.maia --denormalize -i test/BTC-USD-ann-trained-output.csv --minimum 28936.355469 --maximum 67566.828125
#./bin/maianne.maia --denormalize -i test/BTC-USD-test-out.csv --minimum 28936.355469 --maximum 67566.828125

#./bin/maianne.maia --column 4 -i "test/ETH-USD.csv"
#sed '1,1d' test/ETH-USD-column-4.csv > test/ETH-USD-Close.csv
#./bin/maianne.maia --normalize -i test/ETH-USD-Close.csv
#./bin/maianne.maia --denormalize -i test/ETH-USD-Close-normalized.csv --minimum 1787.510742 --maximum 4812.087402
#./bin/maianne.maia --split --nfirst 300 -i test/ETH-USD-Close-normalized.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/ETH-USD-Close-normalized-300.csv
#./bin/maianne.maia --nextstep --steps 5 -i test/ETH-USD-Close-normalized-67.csv

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/ETH-USD-ann.net
#sed '$ d' test/ETH-USD-Close-normalized-300-steps.csv > test/ETH-USD-train-in.csv
#sed '1,5d' test/ETH-USD-Close-normalized-300.csv > test/ETH-USD-train-out.csv
#sed '$ d' test/ETH-USD-Close-normalized-67-steps.csv > test/ETH-USD-test-in.csv
#sed '1,5d' test/ETH-USD-Close-normalized-67.csv > test/ETH-USD-test-out.csv
#./bin/maianne.maia --its test/ETH-USD-train-in.csv --ots test/ETH-USD-train-out.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/ETH-USD-ann.net
#./bin/maianne.maia -i test/ETH-USD-test-in.csv --ni 5 --no 1 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/ETH-USD-ann-trained.net
#./bin/maianne.maia --denormalize -i test/ETH-USD-ann-trained-output.csv --minimum 1787.510742 --maximum 4812.087402
#./bin/maianne.maia --denormalize -i test/ETH-USD-test-out.csv --minimum 1787.510742 --maximum 4812.087402
