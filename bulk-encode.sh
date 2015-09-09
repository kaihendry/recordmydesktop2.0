#!/bin/bash

OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.
while getopts "n" opt; do
	case "$opt" in
		n)  input="a"
			;;
	esac
done
shift "$((OPTIND-1))" # Shift off the options and optional --.

shopt -s nocaseglob
shopt -s globstar

i=0; files=("${1:-.}"/**/*.{mp4,mov,mkv}); number=${#files[@]}; for f in "${files[@]}"
do
	((i++))
	printf '%s/%s ' $i $number; du -h "$f"
	test "$input" == "a" || read input </dev/tty
	if [[ $input =~ ^[Yya]$ ]]
	then
		time ./htmlvideo "$f"
	fi
done
