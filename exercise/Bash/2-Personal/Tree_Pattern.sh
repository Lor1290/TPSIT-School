#!/bin/bash

function MulStr() {
	for((x = 0; x < $1; x++)); do
		printf "%s" $2	
	done
}

function Tree() {
	for(( x = 0; x < $1; x ++)); do

		MulStr $$(( %1 - x )) " "
		MulStr $x "*"
		echo ;
	done	
}

main() {
	echo "Tree Pattern: \n"
	tree 10
	echo; 

	return 1
}	

main