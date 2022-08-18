#!/bin/sh

#
# Simple tests.
#

#./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net
#./bin/maianne.maia --its test/its-01.csv --ots test/ots-01.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net
#./bin/maianne.maia -i test/in-01.csv --ni 1 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/mlp-trained.net

#./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/ADA-USD-Close.net
#./bin/maianne.maia -i test/ADA-USD-Close.csv --normalize
#./bin/maianne.maia -i test/ADA-USD-Close-normalized.csv --split --nfirst 256
#./bin/maianne.maia -i test/ADA-USD-Close-normalized-111.csv --nextstep --steps 5
#./bin/maianne.maia -i test/ADA-USD-Close-normalized-256.csv --nextstep --steps 5
#sed '$ d' test/ADA-USD-Close-normalized-256-steps.csv > test/ADA-USD-Close-input-training.csv
#sed '1,5d' test/ADA-USD-Close-normalized-256.csv > test/ADA-USD-Close-output-training.csv
#sed '$ d' test/ADA-USD-Close-normalized-111-steps.csv > test/ADA-USD-Close-input-testing.csv
#sed '1,5d' test/ADA-USD-Close-normalized-111.csv > test/ADA-USD-Close-output-testing.csv
#./bin/maianne.maia --its test/ADA-USD-Close-input-training.csv --ots test/ADA-USD-Close-output-training.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/ADA-USD-Close.net
#./bin/maianne.maia -i test/ADA-USD-Close-input-testing.csv --ni 5 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/ADA-USD-Close-trained.net
#../maiastatistics/bin/maiastatistics.maia --plot -o test/ADA-USD-Close.png -i test/ADA-USD-graph.json

#./bin/maianne.maia --auto --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 --normalize --steps 5 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 "test/cryptocoins/*-Close.csv"
#../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/ADA-USD-Close.png -i test/cryptocoins/ADA-USD-graph.json
#../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/XRP-USD-Close.png -i test/cryptocoins/XRP-USD-graph.json
