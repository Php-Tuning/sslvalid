#!/bin/bash

color_error="\e[41m"
color_success="\e[42m"
color_normal="\e[49m"
color_option="-e"

colorized="true"

if [[ "$1" == "https://"* ]] ; then
	#echo correct protocol
	domain="$1"
elif [[ "$1" == "http"* ]] ; then
	#echo "correct protocol"
	domain="$(echo "$1" | sed 's/http:\/\//https:\/\//' -)"
	#echo "corrected domain: $domain"
	#exit
else
	domain="https://$1"
fi

if [ "$colorized" != "true" ] ; then
	color_error=""
	color_success=""
	color_normal=""
	color_option=""
fi

if [ "$(curl "$domain" -I 2> /dev/null)" ] ; then 
	echo "${color_option}" "${color_success}valid${color_normal}"
else
	echo "${color_option}" "${color_error}invalid${color_normal}"
fi
