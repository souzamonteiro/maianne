# MaiaANN Manual - Artificial Neural Networks

## Overview

MaiaANN is a comprehensive neural network tool for creating, training, and deploying artificial neural networks. This manual covers the complete workflow from data preparation to network deployment.

## Table of Contents

1. [Basic Network Operations](#basic-network-operations)
2. [Data Preparation](#data-preparation)
3. [Network Training](#network-training)
4. [Network Deployment](#network-deployment)
5. [Automated Workflows](#automated-workflows)
6. [Complete Examples](#complete-examples)

## Basic Network Operations

### Creating Neural Networks

```bash
# Create a basic MLP network
./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net

# Create a larger network for time series prediction
./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/ADA-USD-Close.net
```

**Parameters:**
- `--topology`: Network architecture (mlp, etc.)
- `--ni`: Number of input neurons
- `--no`: Number of output neurons
- `--nl`: Number of hidden layers
- `--nhu`: Number of hidden units per layer
- `-o`: Output network file

## Data Preparation

### Data Normalization

```bash
# Normalize input data
./bin/maianne.maia -i test/ADA-USD-Close.csv --normalize
```

### Data Splitting

```bash
# Split dataset into training and testing sets
./bin/maianne.maia -i test/ADA-USD-Close-normalized.csv --split --nfirst 256
```

### Time Series Preparation

```bash
# Create next steps for time series prediction
./bin/maianne.maia -i test/ADA-USD-Close-normalized-111.csv --nextstep --steps 5
./bin/maianne.maia -i test/ADA-USD-Close-normalized-256.csv --nextstep --steps 5
```

### Input/Output File Preparation

```bash
# Prepare training input (remove last row)
sed '$ d' test/ADA-USD-Close-normalized-256-steps.csv > test/ADA-USD-Close-input-training.csv

# Prepare training output (remove first 5 rows)
sed '1,5d' test/ADA-USD-Close-normalized-256.csv > test/ADA-USD-Close-output-training.csv

# Prepare testing input
sed '$ d' test/ADA-USD-Close-normalized-111-steps.csv > test/ADA-USD-Close-input-testing.csv

# Prepare testing output
sed '1,5d' test/ADA-USD-Close-normalized-111.csv > test/ADA-USD-Close-output-testing.csv
```

## Network Training

### Basic Training

```bash
# Train network with basic parameters
./bin/maianne.maia --its test/its-01.csv --ots test/ots-01.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net
```

### Advanced Training for Financial Data

```bash
# Train network for cryptocurrency prediction
./bin/maianne.maia --its test/ADA-USD-Close-input-training.csv --ots test/ADA-USD-Close-output-training.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/ADA-USD-Close.net
```

**Training Parameters:**
- `--its`: Input training set file
- `--ots`: Output training set file
- `--lrate`: Learning rate (e.g., 0.005)
- `--af`: Activation function for hidden layers (tanh, sigmoid, relu)
- `--oaf`: Output activation function (linear, sigmoid, tanh)
- `--of`: Output function (none, softmax, etc.)
- `--ofc`: Output function coefficients
- `--loops`: Use loop-based processing
- `--prepare`: Prepare data before training
- `--nw`: No weights initialization (use existing)
- `--epochs`: Number of training epochs
- `--correct`: Correctness threshold for early stopping
- `--interval`: Progress reporting interval

## Network Deployment

### Running Trained Networks

```bash
# Run basic trained network
./bin/maianne.maia -i test/in-01.csv --ni 1 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/mlp-trained.net

# Run cryptocurrency prediction network
./bin/maianne.maia -i test/ADA-USD-Close-input-testing.csv --ni 5 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/ADA-USD-Close-trained.net
```

**Deployment Parameters:**
- `-i`: Input data file
- `--ni`: Number of input neurons (must match training)
- `--no`: Number of output neurons (must match training)
- `--af`: Activation function (must match training)
- `--oaf`: Output activation function (must match training)
- Network file: Trained network file

## Automated Workflows

### Batch Processing Multiple Files

```bash
# Automated processing for multiple cryptocurrency files
./bin/maianne.maia --auto --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 --normalize --steps 5 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 "test/cryptocoins/*-Close.csv"
```

**Automated Parameters:**
- `--auto`: Enable automated batch processing
- `--normalize`: Auto-normalize input data
- `--steps`: Auto-create time steps
- All training parameters work in auto mode
- File globbing supported for multiple files

## Visualization

### Creating Performance Graphs

```bash
# Create PNG visualization
../maiastatistics/bin/maiastatistics.maia --plot -o test/ADA-USD-Close.png -i test/ADA-USD-graph.json

# Create multiple visualizations
../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/ADA-USD-Close.png -i test/cryptocoins/ADA-USD-graph.json
../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/XRP-USD-Close.png -i test/cryptocoins/XRP-USD-graph.json
```

## Complete Examples

### Example 1: Basic Function Approximation

```bash
#!/bin/bash

# 1. Create network
./bin/maianne.maia --create --topology mlp --ni 1 --no 1 --nl 1 --nhu 3 -o test/mlp.net

# 2. Train network
./bin/maianne.maia --its test/its-01.csv --ots test/ots-01.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/mlp.net

# 3. Run trained network
./bin/maianne.maia -i test/in-01.csv --ni 1 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/mlp-trained.net
```

### Example 2: Financial Time Series Prediction

```bash
#!/bin/bash

# Cryptocurrency price prediction workflow

# 1. Create network architecture
./bin/maianne.maia --create --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 -o test/ADA-USD-Close.net

# 2. Prepare data
./bin/maianne.maia -i test/ADA-USD-Close.csv --normalize
./bin/maianne.maia -i test/ADA-USD-Close-normalized.csv --split --nfirst 256

# 3. Create time steps
./bin/maianne.maia -i test/ADA-USD-Close-normalized-111.csv --nextstep --steps 5
./bin/maianne.maia -i test/ADA-USD-Close-normalized-256.csv --nextstep --steps 5

# 4. Prepare training files
sed '$ d' test/ADA-USD-Close-normalized-256-steps.csv > test/ADA-USD-Close-input-training.csv
sed '1,5d' test/ADA-USD-Close-normalized-256.csv > test/ADA-USD-Close-output-training.csv

# 5. Prepare testing files  
sed '$ d' test/ADA-USD-Close-normalized-111-steps.csv > test/ADA-USD-Close-input-testing.csv
sed '1,5d' test/ADA-USD-Close-normalized-111.csv > test/ADA-USD-Close-output-testing.csv

# 6. Train network
./bin/maianne.maia --its test/ADA-USD-Close-input-training.csv --ots test/ADA-USD-Close-output-training.csv --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 test/ADA-USD-Close.net

# 7. Test network
./bin/maianne.maia -i test/ADA-USD-Close-input-testing.csv --ni 5 --no 1 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops test/ADA-USD-Close-trained.net

# 8. Create visualization
../maiastatistics/bin/maiastatistics.maia --plot -o test/ADA-USD-Close.png -i test/ADA-USD-graph.json
```

### Example 3: Batch Processing Multiple Assets

```bash
#!/bin/bash

# Automated processing for multiple cryptocurrencies

# 1. Batch process all cryptocurrency files
./bin/maianne.maia --auto --topology mlp --ni 5 --no 1 --nl 2 --nhu 10 --normalize --steps 5 --lrate 0.005 --af tanh --oaf linear --of none --ofc "[1, 0]" --loops --prepare --nw --epochs 2000 --correct 0.001 --interval 100 "test/cryptocoins/*-Close.csv"

# 2. Generate visualizations for each asset
../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/ADA-USD-Close.png -i test/cryptocoins/ADA-USD-graph.json
../maiastatistics/bin/maiastatistics.maia --plot -o test/cryptocoins/XRP-USD-Close.png -i test/cryptocoins/XRP-USD-graph.json
# ... repeat for other assets
```

## Best Practices

### Data Preparation
1. **Always normalize** data before training
2. **Split data** properly into training and testing sets
3. **Use appropriate time steps** for time series prediction
4. **Ensure input/output dimensions** match network architecture

### Network Architecture
1. **Start with simple networks** and increase complexity as needed
2. **Use appropriate activation functions** (tanh for hidden, linear for output)
3. **Choose learning rates carefully** (0.005 is often a good starting point)
4. **Monitor training progress** with appropriate intervals

### Training Parameters
1. **Use sufficient epochs** for convergence (2000+ for complex problems)
2. **Set correctness thresholds** for early stopping
3. **Use loop processing** for better performance
4. **Prepare data** before training for optimal results

### File Management
1. **Use descriptive filenames** for networks and data files
2. **Keep original data** separate from processed data
3. **Use consistent naming conventions** across workflows
4. **Document network parameters** in filenames or logs

## Troubleshooting

### Common Issues and Solutions

1. **Dimension Mismatch**: Ensure --ni and --no match your data dimensions
2. **Poor Convergence**: Adjust learning rate, network size, or activation functions
3. **Overfitting**: Use more data, simpler networks, or regularization
4. **Memory Issues**: Reduce batch sizes or network complexity

This manual provides a comprehensive guide to using MaiaANN for various neural network tasks. The examples shown demonstrate real-world applications from simple function approximation to complex financial time series prediction.