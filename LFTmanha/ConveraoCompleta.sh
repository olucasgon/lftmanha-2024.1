#!/bin/bash
# LFT-Manha Conversor de número para extenso e vice-versa

execute=true

converteExtenso() {
    local numero=$1

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
        local m=$((numero / 1000000))
        local c=$(( (numero % 1000000) / 100000 ))
        local d=$(( (numero % 100000) / 10000 ))
        local u=$(( (numero % 10000) / 1000 ))
        local cem=$(( (numero % 1000) / 100 ))
        local dec=$(( (numero % 100) / 10 ))
        local uni=$(( numero % 10 ))

        local resultado=""

        if [ $m -ne 0 ]; then
            resultado+="um milhão "
        fi

        case $c in
            1) resultado+="cem mil " ;;
            2) resultado+="duzentos mil " ;;
            3) resultado+="trezentos mil " ;;
            4) resultado+="quatrocentos mil " ;;
            5) resultado+="quinhentos mil " ;;
            6) resultado+="seiscentos mil " ;;
            7) resultado+="setecentos mil " ;;
            8) resultado+="oitocentos mil " ;;
            9) resultado+="novecentos mil " ;;
        esac

        case $d in
            1)
                case $u in
                    0) resultado+="dez mil " ;;
                    1) resultado+="onze mil " ;;
                    2) resultado+="doze mil " ;;
                    3) resultado+="treze mil " ;;
                    4) resultado+="quatorze mil " ;;
                    5) resultado+="quinze mil " ;;
                    6) resultado+="dezesseis mil " ;;
                    7) resultado+="dezessete mil " ;;
                    8) resultado+="dezoito mil " ;;
                    9) resultado+="dezenove mil " ;;
                esac
                ;;
            2) resultado+="vinte " ;;
            3) resultado+="trinta " ;;
            4) resultado+="quarenta " ;;
            5) resultado+="cinquenta " ;;
            6) resultado+="sessenta " ;;
            7) resultado+="setenta " ;;
            8) resultado+="oitenta " ;;
            9) resultado+="noventa " ;;
        esac

        if [ $d -gt 1 ] && [ $u -ne 0 ]; then
            resultado+="e "
        fi

        if [ $d -ne 1 ]; then
            case $u in
                1) resultado+="um " ;;
                2) resultado+="dois " ;;
                3) resultado+="três " ;;
                4) resultado+="quatro " ;;
                5) resultado+="cinco " ;;
                6) resultado+="seis " ;;
                7) resultado+="sete " ;;
                8) resultado+="oito " ;;
                9) resultado+="nove " ;;
            esac
        fi

        if [ $numero -ge 1000 ] && [ $cem -ne 0 ]; then
            resultado+="e "
            case $cem in
                1) resultado+="cem " ;;
                2) resultado+="duzentos " ;;
                3) resultado+="trezentos " ;;
                4) resultado+="quatrocentos " ;;
                5) resultado+="quinhentos " ;;
                6) resultado+="seiscentos " ;;
                7) resultado+="setecentos " ;;
                8) resultado+="oitocentos " ;;
                9) resultado+="novecentos " ;;
            esac
        fi

        if [ $numero -ge 100 ] && [ $dec -ne 0 ]; then
            resultado+="e "
            case $dec in
                1)
                    case $uni in
                        0) resultado+="dez " ;;
                        1) resultado+="onze " ;;
                        2) resultado+="doze " ;;
                        3) resultado+="treze " ;;
                        4) resultado+="quatorze " ;;
                        5) resultado+="quinze " ;;
                        6) resultado+="dezesseis " ;;
                        7) resultado+="dezessete " ;;
                        8) resultado+="dezoito " ;;
                        9) resultado+="dezenove " ;;
                    esac
                    ;;
                2) resultado+="vinte " ;;
                3) resultado+="trinta " ;;
                4) resultado+="quarenta " ;;
                5) resultado+="cinquenta " ;;
                6) resultado+="sessenta " ;;
                7) resultado+="setenta " ;;
                8) resultado+="oitenta " ;;
                9) resultado+="noventa " ;;
            esac
        fi

        if [ $numero -ge 10 ] && [ $uni -ne 0 ] && [ $dec -ne 1 ]; then
            resultado+="e "
            case $uni in
                1) resultado+="um " ;;
                2) resultado+="dois " ;;
                3) resultado+="três " ;;
                4) resultado+="quatro " ;;
                5) resultado+="cinco " ;;
                6) resultado+="seis " ;;
                7) resultado+="sete " ;;
                8) resultado+="oito " ;;
                9) resultado+="nove " ;;
            esac
        fi

        echo $resultado
    fi
}


converteNumero() {
    local extenso="$1"

    extenso=$(echo $extenso | tr -s ' ')

    declare -A numeros=(
        ["zero"]=0 ["um"]=1 ["dois"]=2 ["três"]=3 ["quatro"]=4 ["cinco"]=5
        ["seis"]=6 ["sete"]=7 ["oito"]=8 ["nove"]=9 ["dez"]=10 ["onze"]=11
        ["doze"]=12 ["treze"]=13 ["quatorze"]=14 ["quinze"]=15 ["dezesseis"]=16
        ["dezessete"]=17 ["dezoito"]=18 ["dezenove"]=19 ["vinte"]=20 ["trinta"]=30
        ["quarenta"]=40 ["cinquenta"]=50 ["sessenta"]=60 ["setenta"]=70 ["oitenta"]=80
        ["noventa"]=90 ["cem"]=100 ["cento"]=100 ["duzentos"]=200 ["trezentos"]=300
        ["quatrocentos"]=400 ["quinhentos"]=500 ["seiscentos"]=600 ["setecentos"]=700
        ["oitocentos"]=800 ["novecentos"]=900 ["mil"]=1000 ["milhão"]=1000000
    )

    local total=0
    local soma=0


    for palavra in $extenso; do
        local valor=${numeros[$palavra]}

        if [ -z "$valor" ]; then
            echo "Palavra '$palavra' não reconhecida. Verifique a entrada."
            return
        fi

        if [ $valor -eq 100 ]; then
            if [ $total -eq 0 ]; then
                total=100
            else
                total=$(( total * 100 ))
                soma=$(( soma + total ))
                total=0
            fi
        elif [ $valor -eq 1000 ] || [ $valor -eq 1000000 ]; then
            if [ $total -eq 0 ]; then
                total=1
            fi
            total=$(( total * valor ))
            soma=$(( soma + total ))
            total=0
        else
            total=$(( total + valor ))
        fi
    done

    soma=$(( soma + total ))

    echo $soma
}


echo "Olá, seja bem-vindo ao sistema de conversão!"
echo "Digite seu nome por favor!"
read nome
echo "Olá, $nome! Vamos começar a conversão."

while $execute 
do
    echo "Escolha uma opção:"
    echo "1. Converter número para extenso"
    echo "2. Converter extenso para número"
    echo "3. Sair"

    read opcao

    case $opcao in
        1)
            echo "Informe um número entre 1 e 1000000"
            read numero


            if ! [[ $numero =~ ^[0-9]+$ ]]; then
                echo "Entrada inválida! Por favor, insira um número."
                continue
            fi

            if [ $numero -gt 1000000 ] || [ $numero -lt 0 ]; then
                echo "Número INVÁLIDO! Por favor, insira um número entre 1 e 1000000."
            else
                converteExtenso $numero
            fi
            ;;
        2)
            echo "Informe um número em extenso (em português)"
            read extenso

            
            resultado=$(converteNumero "$extenso")
            if [ -n "$resultado" ]; then
                echo "O número correspondente é: $resultado"
            fi
            ;;
        3)
            echo "Programa finalizado."
            execute=false
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    echo ""

    if [ $execute = true ]; then
        echo "$nome, deseja realizar uma nova conversão? [S/N]"
        read resposta 
        resposta=$(echo "$resposta" | tr '[:lower:]' '[:upper:]')

        while [[ "$resposta" != "S" && "$resposta" != "N" && "$resposta" != "s" && "$resposta" != "n" ]]; do
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
    fi
done
