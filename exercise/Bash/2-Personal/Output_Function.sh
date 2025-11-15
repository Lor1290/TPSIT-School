#!bin/bash


#######################
# --- TEST OUTPUT --- #
#######################

function MyFirst() {
	echo "I Am Alive"
	echo I Am Alice

	return 1
}

function IceCream() {
	echo "Why do people like ${1} when ${2} is superior?"
	echo Why do people like ${1} when ${2} is superior?

	return 1
}

function GratherThan() {
	for num in ${@}; do
		if [[ ${num} -gt 60 ]]; then 
			echo "${num} is greather then 60"
		elif [[ ${num} -eq 60 ]]; then
			echo "${num} is precisely 60"
		else
			echo "${num} is not greather then 60"
		fi
	done

	return 1
}

function PrintPizza() {
	Array=('pomodoro' 'mozzarella' 'salamino' 'salsiccia' 'peperoni')
	local x=0

	for elm in ${Array[@]}; do
		echo "Array[$x] = ${elm}"
		$(( x++ ))
	done

	return 1
}

function CompressData() {
	START_PATH=${1}
	END_PATH=${2}
}

main() {
	MyFirst
	IceCream
	GratherThan

	PrintPizza
	CompressData

	return 1;	
}
