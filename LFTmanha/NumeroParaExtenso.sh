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

        if [ $numero -eq 1000000 ]; then
            echo "um milhão"
        elif [ $numero -eq 100000 ]; then
            echo "cem mil"
        elif [ $numero -eq 1000 ]; then
            echo "mil"
        elif [ $numero -eq 100 ]; then
            echo "cem"
        elif [ $numero -eq 0 ]; then
            echo "zero"
        else
            if [ $m -ne 0 ]; then
                echo -n "um milhão "
            fi

            case $c in
                1) echo -n "cem mil " ;;
                2) echo -n "duzentos mil " ;;
                3) echo -n "trezentos mil " ;;
                4) echo -n "quatrocentos mil " ;;
                5) echo -n "quinhentos mil " ;;
                6) echo -n "seiscentos mil " ;;
                7) echo -n "setecentos mil " ;;
                8) echo -n "oitocentos mil " ;;
                9) echo -n "novecentos mil " ;;
            esac

            case $d in
                1)
                    case $u in
                        0) echo -n "dez mil " ;;
                        1) echo -n "onze mil " ;;
                        2) echo -n "doze mil " ;;
                        3) echo -n "treze mil " ;;
                        4) echo -n "quatorze mil " ;;
                        5) echo -n "quinze mil " ;;
                        6) echo -n "dezesseis mil " ;;
                        7) echo -n "dezessete mil " ;;
                        8) echo -n "dezoito mil " ;;
                        9) echo -n "dezenove mil " ;;
                    esac
                    ;;
                2) echo -n "vinte " ;;
                3) echo -n "trinta " ;;
                4) echo -n "quarenta " ;;
                5) echo -n "cinquenta " ;;
                6) echo -n "sessenta " ;;
                7) echo -n "setenta " ;;
                8) echo -n "oitenta " ;;
                9) echo -n "noventa " ;;
            esac

            if [ $d -gt 1 ] && [ $u -ne 0 ]; then
                echo -n "e "
            fi

            if [ $d -ne 1 ]; then
                case $u in
                    1) echo -n "um " ;;
                    2) echo -n "dois " ;;
                    3) echo -n "três " ;;
                    4) echo -n "quatro " ;;
                    5) echo -n "cinco " ;;
                    6) echo -n "seis " ;;
                    7) echo -n "sete " ;;
                    8) echo -n "oito " ;;
                    9) echo -n "nove " ;;
                esac
            fi

            if [ $numero -ge 1000 ] && [ $cem -ne 0 ]; then
                echo -n "e "
                case $cem in
                    1) echo -n "cem " ;;
                    2) echo -n "duzentos " ;;
                    3) echo -n "trezentos " ;;
                    4) echo -n "quatrocentos " ;;
                    5) echo -n "quinhentos " ;;
                    6) echo -n "seiscentos " ;;
                    7) echo -n "setecentos " ;;
                    8) echo -n "oitocentos " ;;
                    9) echo -n "novecentos " ;;
                esac
            fi

            if [ $numero -ge 100 ] && [ $dec -ne 0 ]; then
                echo -n "e "
                case $dec in
                    1)
                        case $uni in
                            0) echo -n "dez " ;;
                            1) echo -n "onze " ;;
                            2) echo -n "doze " ;;
                            3) echo -n "treze " ;;
                            4) echo -n "quatorze " ;;
                            5) echo -n "quinze " ;;
                            6) echo -n "dezesseis " ;;
                            7) echo -n "dezessete " ;;
                            8) echo -n "dezoito " ;;
                            9) echo -n "dezenove " ;;
                        esac
                        ;;
                    2) echo -n "vinte " ;;
                    3) echo -n "trinta " ;;
                    4) echo -n "quarenta " ;;
                    5) echo -n "cinquenta " ;;
                    6) echo -n "sessenta " ;;
                    7) echo -n "setenta " ;;
                    8) echo -n "oitenta " ;;
                    9) echo -n "noventa " ;;
                esac
            fi

            if [ $numero -ge 10 ] && [ $uni -ne 0 ] && [ $dec -ne 1 ]; then
                echo -n "e "
                case $uni in
                    1) echo -n "um " ;;
                    2) echo -n "dois " ;;
                    3) echo -n "três " ;;
                    4) echo -n "quatro " ;;
                    5) echo -n "cinco " ;;
                    6) echo -n "seis " ;;
                    7) echo -n "sete " ;;
                    8) echo -n "oito " ;;
                    9) echo -n "nove " ;;
                esac
            fi
        fi
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
