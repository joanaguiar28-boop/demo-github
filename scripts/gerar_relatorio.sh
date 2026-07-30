#!/bin/bash

ficheiro_dados="Dados/vendas_servidor.csv"
pasta_resultados="resultados"
pasta_logs="logs"

ficheiro_relatorio="$pasta_resultados/relatorio_vendas.txt"
ficheiro_log="$pasta_logs/execucao.log"

echo "Gerando relatório de vendas..."

# Cria pasta de resultados
mkdir -p $pasta_resultados

# Cria pasta de logs
mkdir -p $pasta_logs

if [ ! -f "$ficheiro_dados" ]; then
    echo "O ficheiro $ficheiro_dados não foi encontrado."
    exit 1
fi


# Número de linhas do ficheiro de dados

    total_linhas=$(wc -l < "$ficheiro_dados")

# Número de registos do ficheiro de dados = Número de linhas menos a linha de cabeçalho
    if [ $total_linhas -gt 0 ]; then
    total_registos=$((total_linhas - 1)) 
    else
    total_registos = 0
    fi



    # 29/07
    {
    echo "RELATÓRIO DE VENDAS"
    echo "--------------------"
    echo
    echo "Data de execução: $(date)"
    echo "Runner: $(hostname)"
    echo "Utilizador: $(whoami)"
    echo "Ficheiro de dados: $ficheiro_dados"
    echo "Total de registos: $total_registos"
    echo "Total de linhas: $total_linhas"
    echo
    echo "Primeiros 5 registos:"
    echo "---------------------"
    head -n 6 "$ficheiro_dados"
    } > "$ficheiro_relatorio"

    echo "$(date) - Relatório criado: $ficheiro_relatorio" >> "$ficheiro_log"

    echo "Ficheiro relatório gerado: $ficheiro_relatorio"