#!/bin/bash
# https://trac.ffmpeg.org/wiki/Concatenate

tmp=$(mktemp)

for i in "$@"
do
	test -f "$i" || continue
	echo file \'$(readlink -f "$i")\' >> $tmp
done

#cat $tmp

ffmpeg -f concat -i $tmp -c copy output.mp4
