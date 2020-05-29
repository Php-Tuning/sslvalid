#!/bin/bash
#this script is designed to just be used with domain names
workdir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
while [ 1 ] ; do
	date
	"${workdir}/sslvalid.sh" "$1"
	"${workdir}/sslvalid.sh" "www.${1}"
	sleep 300
done
