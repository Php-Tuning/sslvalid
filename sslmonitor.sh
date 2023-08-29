#!/bin/bash
#this script is designed to just be used with domain names
workdir="$( cd "$(dirname "$0")" || exit >/dev/null 2>&1 ; pwd -P )"
interval="10" # interval in seconds
while true ; do
	date
	"${workdir}/sslvalid.sh" "$1"
	"${workdir}/sslvalid.sh" "www.${1}"
	sleep "${interval}"
done
