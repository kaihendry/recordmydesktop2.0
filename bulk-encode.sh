#!/bin/bash
shopt -s nocaseglob
shopt -s globstar

i=0; files=("${1:-.}"/**/*.mp4); number=${#files[@]}; for f in "${files[@]}"
do
	((i++))
	echo $i/$number $(du -h "$f")
	read input </dev/tty
	if [[ $input =~ ^[Yy]$ ]]
	then
		echo time ./htmlvideo "$f"
	fi
done
