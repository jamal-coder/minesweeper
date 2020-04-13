#!/bin/bash

#-------Variables---------
field=("-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-")
mines=()
bombs=10
count=0
area=0
points=0
counter=0
attempts=0
rm temp
#-------Functions--------
function ground {
	clear
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|\t\t\t\t\tM I N E S   S W E E P E R\t\t\t\t\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|y\x\t|\t<0>\t|\t<1>\t|\t<2>\t|\t<3>\t|\t<4>\t|\t<5>\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<0>\t|\t${field[0]}\t|\t${field[1]}\t|\t${field[2]}\t|\t${field[3]}\t|\t${field[4]}\t|\t${field[5]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<1>\t|\t${field[6]}\t|\t${field[7]}\t|\t${field[8]}\t|\t${field[9]}\t|\t${field[10]}\t|\t${field[11]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<2>\t|\t${field[12]}\t|\t${field[13]}\t|\t${field[14]}\t|\t${field[15]}\t|\t${field[16]}\t|\t${field[17]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<3>\t|\t${field[18]}\t|\t${field[19]}\t|\t${field[20]}\t|\t${field[21]}\t|\t${field[22]}\t|\t${field[23]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<4>\t|\t${field[24]}\t|\t${field[25]}\t|\t${field[26]}\t|\t${field[27]}\t|\t${field[28]}\t|\t${field[29]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
	echo -e "|<5>\t|\t${field[30]}\t|\t${field[31]}\t|\t${field[32]}\t|\t${field[33]}\t|\t${field[34]}\t|\t${field[35]}\t|"
	echo "---------------------------------------------------------------------------------------------------------"
}

function Input {
	read -p "$1" val 
	echo $val
}

function mineFileds {
	RANDOM=$(date +%N)
	for i in {0..9}; do
		mines[i]=$((RANDOM % 36))
	done
}

function checkCell {
	cell=0

	for i in {0..9}; do
		#echo $1 : ${mines[i]} : $cell
		#Input "Press Enter"

		if [[ $1 -eq ${mines[i]} ]]; then
			cell="X"
			break
		elif [[ $(($1-7)) -eq ${mines[i]} && $(($1-7)) -ge 0 ]]; then
			if [[ $1 -ne 12 && $1 -ne 18 && $1 -ne 24 && $1 -ne 30 ]]; then
				((cell+=1))
			fi
		elif [[ $(($1-6)) -eq ${mines[i]} && $(($1-6)) -ge 0 ]]; then
			((cell+=1))
		elif [[ $(($1-5)) -eq ${mines[i]} && $(($1-5)) -ge 0 ]]; then
			if [[ $1 -ne 5 && $1 -ne 11 && $1 -ne 17 && $1 -ne 23 && $1 -ne 29 && $1 -ne 35 ]]; then
				((cell+=1))
			fi
		elif [[ $(($1-1)) -eq ${mines[i]} && $(($1-1)) -ge 0 ]]; then
			if [[ $1 -ne 6 && $1 -ne 12 && $1 -ne 18 && $1 -ne 24 && $1 -ne 30 ]]; then
				((cell+=1))
			fi
		elif [[ $(($1+1)) -eq ${mines[i]} && $(($1+1)) -le 35 ]]; then
			if [[ $1 -ne 5 && $1 -ne 11 && $1 -ne 17 && $1 -ne 23 && $1 -ne 29 ]]; then
				((cell+=1))
			fi
		elif [[ $(($1+5)) -eq ${mines[i]} && $(($1+5)) -le 35 ]]; then
			if [[ $1 -ne 6 && $1 -ne 12 && $1 -ne 18 && $1 -ne 24 && $1 -ne 30 ]]; then
				((cell+=1))
			fi
		elif [[ $(($1+6)) -eq ${mines[i]} && $(($1+6)) -le 35 ]]; then
			((cell+=1))
		elif [[ $(($1+7)) -eq ${mines[i]} && $(($1+7)) -le 35 ]]; then
			if [[ $1 -ne 5 && $1 -ne 11 && $1 -ne 17 && $1 -ne 23 ]]; then
				((cell+=1))
			fi
		fi
	done
	
	echo $cell
	
}


#------Main Programme-------
clear
echo "Please Maximize your Terminal"
sleep 3
# calling mineFields to load mines
echo "Please wait mines are loading in the field..."
while [[ true ]]; do
	result=0
	mineFileds
	for x in {0..9}; do
		for y in {0..9}; do
			if [[ ${mines[x]} -eq ${mines[y]} && $x -ne $y ]]; then
				result=1
			fi
		done 
	done
	if [[ $result -eq 0 ]]; then
		break
	fi
done

#checkCell 8

count=36
points=0
while [ true ]; do
	ground
	echo
	echo -e "\t\tFileds : $count\t\t\t\t\t\tMines : $bombs"
	echo
	ys=$(Input "Enter Y Co-ordinate : ")
	echo
	xs=$(Input "Enter X Co-ordinate : ")
	select=$ys$xs
	
	case $select in
		00) 
			area=$(checkCell 0)
			counter=0
			;;
		01) 
			area=$(checkCell 1)
			counter=1
			;;
		02) 
			area=$(checkCell 2)
			counter=2
			;;
		03) 
			area=$(checkCell 3)
			counter=3
			;;
		04) 
			area=$(checkCell 4)
			counter=4
			;;
		05) 
			area=$(checkCell 5)
			counter=5
			;;
		10) 
			area=$(checkCell 6)
			counter=6
			;;
		11) 
			area=$(checkCell 7)
			counter=7
			;;
		12) 
			area=$(checkCell 8)
			counter=8
			;;
		13) 
			area=$(checkCell 9)
			counter=9
			;;
		14) 
			area=$(checkCell 10)
			counter=10
			;;
		15) 
			area=$(checkCell 11)
			counter=11
			;;
		20) 
			area=$(checkCell 12)
			counter=12
			;;
		21) 
			area=$(checkCell 13)
			counter=13
			;;
		22) 
			area=$(checkCell 14)
			counter=14
			;;
		23) 
			area=$(checkCell 15)
			counter=15
			;;
		24) 
			area=$(checkCell 16)
			counter=16
			;;
		25) 
			area=$(checkCell 17)
			counter=17
			;;
		30) 
			area=$(checkCell 18)
			counter=18
			;;
		31) 
			area=$(checkCell 19)
			counter=19
			;;
		32) 
			area=$(checkCell 20)
			counter=20
			;;
		33) 
			area=$(checkCell 21)
			counter=21
			;;
		34) 
			area=$(checkCell 22)
			counter=22
			;;
		35) 
			area=$(checkCell 23)
			counter=23
			;;
		40) 
			area=$(checkCell 24)
			counter=24
			;;
		41) 
			area=$(checkCell 25)
			counter=25
			;;
		42) 
			area=$(checkCell 26)
			counter=26
			;;
		43) 
			area=$(checkCell 27)
			counter=27
			;;
		44) 
			area=$(checkCell 28)
			counter=28
			;;
		45) 
			area=$(checkCell 29)
			counter=29
			;;
		50) 
			area=$(checkCell 30)
			counter=30
			;;
		51) 
			area=$(checkCell 31)
			counter=31
			;;
		52) 
			area=$(checkCell 32)
			counter=32
			;;
		53) 
			area=$(checkCell 33)
			counter=33
			;;
		54) 
			area=$(checkCell 34)
			counter=34
			;;
		55) 
			area=$(checkCell 35)
			counter=35
			;;
		*)
			echo
			echo "---------------"
			echo "Wrong selection"
			echo "---------------"
			echo "Select from [0-5]"
			Input "Press Enter...."
			continue
	esac

	echo $counter >> temp

	check=$(grep -c $counter temp)

	echo $check


	if [[ $check -eq 1 ]]; then
		((count--))
	fi

	if [[ $count -eq 10 ]]; then
		break
	fi

	field[counter]=$area
	if [[ $area == "X" ]]; then
		result="Failed"
		ground
		break
	else
		((points+=5))
	fi

done
rm temp

echo "------------------------------------------"
if [[ $result == "Failed" ]]; then
	echo "You failed to clear all the Mines"
else
	echo "Weldone You cleared the Mines"
	points=180
fi
echo "------------------------------------------"
echo "Remaining Fields : $count"
echo "Your Points      : $points"
echo



