#!/bin/bash
# LFT-Manha Conversor de numero para extenso

execute=true

echo "Olá, seja bem-vindo ao sistema de conversão!"
echo "Digite seu nome por favor!"
read nome
echo "Olá, $nome! Vamos começar a conversão."

while $execute 
do
    echo "Informe um número entre 1 e 1000000"
    read numero
    

    if ! [[ $numero =~ ^[0-9]+$ ]]; then
        echo "Entrada inválida! Por favor, insira um número."
        continue
    fi

    if [ $numero -gt 1000000 ] || [ $numero -lt 0 ]; then
        echo "Número INVÁLIDO! Por favor, insira um número entre 1 e 1000000."
    else
        m=$((numero / 1000000))
        c=$(( (numero % 1000000) / 100000 ))
        d=$(( (numero % 100000) / 10000 ))
        u=$(( (numero % 10000) / 1000 ))
        cem=$(( (numero % 1000) / 100 ))
        dec=$(( (numero % 100) / 10 ))
        uni=$(( numero % 10 ))

        output=""

        if [ $numero -eq 1000000 ]; then
            output="um milhão"
        elif [ $numero -eq 100000 ]; then
            output="cem mil"
        elif [ $numero -eq 1000 ]; then
            output="mil"
        elif [ $numero -eq 100 ]; then
            output="cem"
        elif [ $numero -eq 0 ]; then
            output="zero"
        else
            if [ $m -ne 0 ]; then
                output+="um milhão "
            fi

            case $c in
                1) output+="cem mil " ;;
                2) output+="duzentos mil " ;;
                3) output+="trezentos mil " ;;
                4) output+="quatrocentos mil " ;;
                5) output+="quinhentos mil " ;;
                6) output+="seiscentos mil " ;;
                7) output+="setecentos mil " ;;
                8) output+="oitocentos mil " ;;
                9) output+="novecentos mil " ;;
            esac

            if [ $d -eq 1 ]; then
                case $u in
                    0) output+="dez mil " ;;
                    1) output+="onze mil " ;;
                    2) output+="doze mil " ;;
                    3) output+="treze mil " ;;
                    4) output+="quatorze mil " ;;
                    5) output+="quinze mil " ;;
                    6) output+="dezesseis mil " ;;
                    7) output+="dezessete mil " ;;
                    8) output+="dezoito mil " ;;
                    9) output+="dezenove mil " ;;
                esac
            else
                case $d in
                    2) output+="vinte mil " ;;
                    3) output+="trinta mil " ;;
                    4) output+="quarenta mil " ;;
                    5) output+="cinquenta mil " ;;
                    6) output+="sessenta mil " ;;
                    7) output+="setenta mil " ;;
                    8) output+="oitenta mil " ;;
                    9) output+="noventa mil " ;;
                esac

                if [ $u -ne 0 ]; then
                    if [ $d -gt 1 ]; then
                        output+="e "
                    fi
                    case $u in
                        1) output+="mil " ;;
                        2) output+="dois mil " ;;
                        3) output+="três mil " ;;
                        4) output+="quatro mil " ;;
                        5) output+="cinco mil " ;;
                        6) output+="seis mil " ;;
                        7) output+="sete mil " ;;
                        8) output+="oito mil " ;;
                        9) output+="nove mil " ;;
                    esac
                fi
            fi

            if [ $cem -ne 0 ]; then
                output+="e "
                case $cem in
                    1) output+="cem " ;;
                    2) output+="duzentos " ;;
                    3) output+="trezentos " ;;
                    4) output+="quatrocentos " ;;
                    5) output+="quinhentos " ;;
                    6) output+="seiscentos " ;;
                    7) output+="setecentos " ;;
                    8) output+="oitocentos " ;;
                    9) output+="novecentos " ;;
                esac
            fi

            if [ $dec -eq 1 ]; then
                output+="e "
                case $uni in
                    0) output+="dez " ;;
                    1) output+="onze " ;;
                    2) output+="doze " ;;
                    3) output+="treze " ;;
                    4) output+="quatorze " ;;
                    5) output+="quinze " ;;
                    6) output+="dezesseis " ;;
                    7) output+="dezessete " ;;
                    8) output+="dezoito " ;;
                    9) output+="dezenove " ;;
                esac
            else
                case $dec in
                    2) output+="vinte " ;;
                    3) output+="trinta " ;;
                    4) output+="quarenta " ;;
                    5) output+="cinquenta " ;;
                    6) output+="sessenta " ;;
                    7) output+="setenta " ;;
                    8) output+="oitenta " ;;
                    9) output+="noventa " ;;
                esac

                if [ $uni -ne 0 ]; then
                    output+="e "
                    case $uni in
                        1) output+="um " ;;
                        2) output+="dois " ;;
                        3) output+="três " ;;
                        4) output+="quatro " ;;
                        5) output+="cinco " ;;
                        6) output+="seis " ;;
                        7) output+="sete " ;;
                        8) output+="oito " ;;
                        9) output+="nove " ;;
                    esac
                fi
            fi
        fi

        echo "$output"
    fi

    echo ""
    echo "$nome, deseja realizar uma nova conversão? [S/N]"
    read resposta 
    resposta=$(echo "$resposta" | tr '[:lower:]' '[:upper:]')

    while [[ "$resposta" != "S" && "$resposta" != "N" && "$resposta" != "n" && "$resposta" != "s" ]]; do
        echo "Resposta inválida. Por favor, responda com S (Sim) ou N (Não):"
        read resposta
        resposta=$(echo "$resposta" | tr '[:lower:]' '[:upper:]')
    done
    
    if [[ "$resposta" == "S" || "$resposta" == "s" ]]; then
        execute=true
    else
        echo "Programa finalizado."
        echo "Obrigado por utilizar nosso conversor, volte sempre, $nome."
        execute=false
    fi
done
