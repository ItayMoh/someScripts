#!/usr/bin/env bash

if [ ! -x "$(command -v jq)" ]; then
	echo "This script requires jq to run. Exiting."
	exit 1
fi

certificateData(){
	declare -a arr=( "%" "%.%" "%.%.%" "%.%.%.%" "%.%.%.%.%" "%.%.%.%.%.%")
	
	for i in "${arr[@]}"
	do
		crtsh=$(curl -s https://crt.sh/\?q\=$i.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u ) 
		echo "$crtsh"
	done
}

certificateData $1
