#!/bin/bash

###########################
# --- PIRAMID PATTERN --- #
###########################
function piramid() {
	local data=0
	local space=${1}

	for((x=0 ; x < ${1}; x++)); do
		(( space -= 1 ))

		print_string ${space} " "
		print_string ${data} "*"

		(( data += 2 ))
		
		echo
	done

}

###########################
# --- DIAMOND PATTERN --- #
###########################
function diamond() {
	local data=0
	local space=${1}

	for((x=0 ; x < ${1}; x++)); do
		(( space -= 1 ))

		print_string ${space} " "
		print_string ${data} "*"

		(( data += 2 ))

		echo
	done
	
	for((x=${1}-1; x > 0; x-- )); do
		(( data -= 2 ))

		print_string ${space} " "
		print_string ${data} "*"	

		(( space += 1 ))	

		echo
	done
}

#######################
# --- MY FUNCTION --- #
#######################
function print_string() {
	for((x=0; x <= ${1}; x++)); do
		echo -en "${2}"
	done
}

function main() {
	echo "Piramid pattern: "
	piramid 10
	echo ;
	
	echo "Diamond pattern: "
	diamond 10
	echo ;

	return 1
}

main