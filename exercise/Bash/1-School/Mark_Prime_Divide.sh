#!/bin/bash


function mark_student() {
	let mark=$1						# dichiaro tale variabile con let dato
									# che rappresenta un "Integer" nel mio codice
									#
	if [[ mark -le 10 ]]; then		# faccio un controllo se il numero fornito è valido	
		case $mark in
			10)
				echo Excellent! ;;
			9)
				echo Very good! ;;
			8)
				echo Good! ;;
			7)
				echo Good Work! ;;
			6)
				echo Sufficent ;;
			5) 
				echo Not Sufficent... ;;
			*) 
				echo You Suck! ;;
		esac
	else
		echo Invalid Mark!			# output dato in caso di input errato (superato il 10)
	fi
}

function prime_number() {
	let num=$1 						# utilizzo il let come nell'esempio precedente
									# per le stesse motivazioni
									#
	if [[ $num -gt 1 ]]; then	
		for (( x=2; x < ${num}; x++ )); do
			if [[ $(( num%x )) -eq 0 ]]; then			
				echo "${num} is not a prime number!"		# output positivo
				return 0									# exit code valid
			fi
		done

		echo "${num} is a prime number!"				# output negativo
		return 1										# exit code invalid
	else
		echo "${num} is not a prime number!"
	fi
}

function divider_of_num() {
	let num=$1
	let	count=0

	echo "Divisor of ${num} are: "
	for (( x=1; x <= ${num}; x++ )); do
		if [[ $(( num%x )) -eq 0 ]]; then
			let "count ++"

			echo -en "${x} "	# stampa solamente il numero, non lo salva
		fi	
	done
	
	echo
	echo "There are ${count} number"
}

declare -a Arr

if [[ ${#@} -eq 3 ]]; then		 
	Arr=($1 $2 $3)			# prende parametri chiamati direttamente da programma
else
	Arr=(7 7 7)				# prende parametri generici gia segnati
fi

mark_student Arr[0]
echo 
prime_number Arr[1]
echo 
divider_of_num Arr[2]
