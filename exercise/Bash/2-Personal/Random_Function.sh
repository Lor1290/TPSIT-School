#!/bin/bash

#################
# --- ALTRO --- #
#################
function sum_number() {
	data=1
	res=$(( data + 1 ))
	echo ${res}
}

function run_command() {
	exec_op="echo"
	${exec_op} "Hello World!"
}

############################
# --- READ AND DECLARE --- #
############################
function read_default() {
	echo -en "Come ti chiami? "
	read name
	echo "Hello! ${nome:-Poli}"
}

function HashMap_declare() {
	declare -A HashMap=( ["giallo"]="yellow")
	# echo "${HashMap[giallo]}"
}

##################################################
# --- BLOCCHI CONDIZIONALI E CICLI ITERATIVI --- #
##################################################
function cicle_iterative() {
	for x in 1 2 3 4 5; do
		echo $x
	done

	for((x = 0; x < 100; x ++)); do
		echo $x
	done

	while [[ $x -lt 0 ]]; do
		echo $x
		$(( x++ ))
	done

	until [[ $x -gt 0 ]]; do
		echo $x
		$(( x++ ))
	done
}

function if_condifiton() { 
	user_name=$(id -nu) 
	user_id=$(id -n)


	if [[ ${user_name} -eq 0 ]]; then
		echo "Your are root"
	else
		echo "You are not root"
	fi
}

function true_or_false() {
	j=10
	i=10

	[ $j = $i ]
	echo $?
}

main() {
	sum_number	
	run_command
	read_default

	HashMap_declare
	cicle_iterative
	if_condifiton

	true_or_false

	return 1
}

main