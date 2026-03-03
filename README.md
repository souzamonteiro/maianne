# MaiaNNE - MaiaScript Neural Network Engine

MaiaNNE é uma ferramenta de linha de comando para criação, treinamento e utilização de redes neurais artificiais, escrita em MaiaScript.

## Características

- **Criação de Redes Neurais**: Suporte para diferentes topologias de redes neurais
- **Treinamento de Redes**: Algoritmos de treinamento com backpropagation
- **Processamento de Dados**: Ferramentas para preparação e normalização de dados
- **Múltiplos Formatos**: Suporte para arquivos CSV, Pajek (.net) e JSON
- **Processamento em Lote**: Capacidade de processar múltiplos arquivos automaticamente

## Instalação

Este projeto requer o interpretador MaiaScript. Certifique-se de ter o MaiaScript instalado e configurado em seu sistema.

## Uso

### Sintaxe Básica

```bash
maianne [opções] [arquivo de entrada] [--] [argumentos]
```

### Opções Principais

#### Ajuda e Informação
- `-h, --help` - Exibe a mensagem de ajuda

#### Arquivos de Entrada/Saída
- `-i [arquivo]` - Arquivo de entrada
- `-o [arquivo]` - Arquivo de saída
- `-r [arquivo]` - Arquivo de relatório estatístico
- `-c [arquivo]` - Arquivo CSV estatístico
- `--cf [arquivo]` - Arquivo CSV de correção
- `--ann [arquivo]` - Arquivo da rede neural
- `--annout [arquivo]` - Arquivo de saída da rede neural
- `--its [arquivo]` - Arquivo do conjunto de treinamento de entrada
- `--ots [arquivo]` - Arquivo do conjunto de treinamento de saída

#### Configuração do Treinamento
- `--skipfirst` - Pular primeira linha dos arquivos de treinamento
- `--separator` - Separador de colunas (padrão=,)
- `--lrate` - Taxa de aprendizado (padrão=0.45)
- `--af` - Função de ativação (padrão=logistic)
- `--oaf` - Função de ativação da camada de saída (padrão=logistic)
- `--of` - Função de saída (padrão=step)
- `--ofc` - Coeficientes da função de saída
- `--loops` - Permitir loops na rede (biases)
- `--prepare` - Preparar a rede neural para aprendizado
- `--nw` - Permitir pesos iniciais negativos
- `--epochs` - Número máximo de épocas para aprendizado
- `--correct` - Correção alvo
- `--interval` - Intervalo de épocas para mostrar progresso

#### Criação de Redes Neurais
- `--create` - Criar uma rede neural artificial
- `--topology` - Topologia da rede neural
- `--vertices` - Número de vértices
- `--edges` - Número de arestas
- `--probability` - Probabilidade de aresta
- `--avgdeg` - Grau médio
- `--ni` - Número de neurônios de entrada
- `--no` - Número de neurônios de saída
- `--nl` - Número de camadas
- `--nhu` - Número de unidades ocultas

#### Processamento de Dados
- `--column` - Criar série temporal com apenas a coluna especificada
- `--replace` - Substituir linhas com padrão em série temporal
- `--with` - Valor de substituição para o padrão dado
- `--split` - Dividir arquivo em duas partes
- `--nfirst` - Número de linhas do primeiro arquivo na divisão
- `--normalize` - Normalizar série temporal
- `--denormalize` - Desnormalizar série temporal
- `--minimum` - Valor mínimo da série temporal
- `--maximum` - Valor máximo da série temporal
- `--nextstep` - Criar nova série com próximos passos
- `--steps` - Número de próximos passos
- `--auto` - Processamento automático de múltiplos arquivos

## Exemplos de Uso

### 1. Criar uma Rede Neural

```bash
maianne --create --topology mlp --ni 10 --no 1 --nhu 5 -o minha_rede.net
```

### 2. Treinar uma Rede Neural

```bash
maianne --ann minha_rede.net --its entrada_treinamento.csv --ots saida_treinamento.csv --annout rede_treinada.net --epochs 1000
```

### 3. Processar Dados com Rede Neural Treinada

```bash
maianne --ann rede_treinada.net -i dados_entrada.csv -o resultado.csv
```

### 4. Processamento Automático

```bash
maianne --auto --create --topology mlp --ni 5 --no 1 --nhu 3 --normalize --steps 3 "dados/*.csv"
```

### 5. Normalizar Dados

```bash
maianne -i dados_brutos.csv --normalize -o dados_normalizados.csv -r relatorio.txt
```

## Formatos de Arquivo Suportados

- **CSV**: Para dados de treinamento e entrada/saída
- **Pajek (.net)**: Para armazenamento de redes neurais
- **JSON**: Para redes neurais (com conversão)

## Funções de Ativação Suportadas

- `tanh` - Tangente hiperbólica
- `logistic` - Função logística
- `linear` - Função linear
- E outras...

## Licença

Copyright 2020 Roberto Luiz Souza Monteiro, Renata Souza Barreto, Hernane Borges de Barros Pereira.

Licenciado sob a Apache License, Versão 2.0. Veja o arquivo LICENSE para mais detalhes.

## Estrutura do Projeto

- `/maia/cna/` - Biblioteca CNA (Complex Network Analysis)
- `/maia/statistics/` - Biblioteca de estatísticas
- O script principal contém a classe `maianne` com método `run()` para execução

## Requisitos

- Node.js
- Interpretador MaiaScript
- Dependências: módulo `glob` para padrões de arquivo