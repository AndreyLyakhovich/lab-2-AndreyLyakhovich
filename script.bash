#!/bin/bash

IPv4=$@
SPLITIP=($(echo $IPv4 | tr "." " "))

i=0
ip1=0
ip2=0
ip3=0
ip4=0
for oct in "${SPLITIP[@]}";
do
	if (( $oct <= 255 )); then
		i=$((i+1))
		if [[ i -eq 1 ]]; then
			ip1=$oct
		elif [[ i -eq 2 ]]; then 
			ip2=$oct
		elif [[ i -eq 3 ]]; then
			ip3=$oct
		else
			ip4=$oct
			i=0
			printf "%08d\n" $(bc <<<"obase=2; $ip1; $ip2; $ip3; $ip4") | paste -sd.;
		fi
	fi

done
echo
