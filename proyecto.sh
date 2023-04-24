#! /bin/bash
inicio=$(date +%s.%N)
echo "¡Bienvenido al simulador de dados!"
echo "Hecho por: Raúl"
echo "---------------------------------"
echo ""
echo -e "Inserta la cantidad de dados: \c"
read dados
echo ""
while true
do
	if [[ $dados =~ ^[0-9]+$ ]]; then
		break
	else
		echo ""
		echo "Error: \"$dados\" no es un número válido."
		echo ""
		echo -e "Inserta la cantidad de dados: \c"
		read dados
		echo ""
	fi
done

echo -e "Inserta la cantidad de caras: \c"
read caras
while true
do
	if [[ $caras =~ ^[0-9]+$ ]]; then
		break
	else
		echo ""
		echo "Error: \"$caras\" no es un número válido."
		echo ""
		echo -e "Inserta la cantidad de caras: \c"
		read caras
		echo ""
	fi
done
echo ""
echo "Petición: $dados dado(s), $caras cara(s)"
echo ""
function dado_grafico() {
	case $resultado in
		1)
			echo "---------"
			echo "|       |"
			echo "|   *   |"
			echo "|       |"
			echo "---------"
			;;
		2)
			echo "---------"
			echo "|     * |"
			echo "|       |"
			echo "| *     |"
			echo "---------"
			;;
		3)
			echo "---------"
			echo "|     * |"
			echo "|   *   |"
			echo "| *     |"
			echo "---------"
			;;
		4)
			echo "---------"
			echo "| *   * |"
			echo "|       |"
			echo "| *   * |"
			echo "---------"
			;;
		5)
			echo "---------"
			echo "| *   * |"
			echo "|   *   |"
			echo "| *   * |"
			echo "---------"
			;;
		6)
			echo "---------"
			echo "| *   * |"
			echo "| *   * |"
			echo "| *   * |"
			echo "---------"
			;;
		*)
			echo "---------"
			echo "|       |"
			echo "|  $(printf '%2d' $resultado)   |"
			echo "|       |"
			echo "---------"
			;;
	esac
}

for ((i=1; i<=dados; i++))
do
	resultado=$(( ( RANDOM % $caras ) + 1 ))
	dado_grafico $resultado
done
fin=$(date +%s.%N)
duracion=$(echo "$fin - $inicio" | bc)
echo ""
echo "Tiempo de ejecución de $duracion segundos."
