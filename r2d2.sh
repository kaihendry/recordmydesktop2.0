#!/bin/bash

usage() {
cat $(readlink -f $(dirname $0))/README.md
}

codec="utvideo"
verbose="-loglevel quiet"
while getopts "o:d:vhu:c:" o
do
	case "$o" in
	(u) dest="$OPTARG";;
	(c) codec="$OPTARG";;
	(d) duration="-t $OPTARG";;
	(v) verbose="";;
	(\?) echo "Invalid option: -$OPTARG" >&2 ;;
	(h) usage; exit;;
	(*) break;;
	esac
done
shift $((OPTIND - 1))
out=${1:-out.webm}

res=$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')
echo Capturing $res to $out. ^C to stop.
ffmpeg -report $duration -f x11grab -s $res -i :0.0 -vcodec $codec -sameq -acodec pcm_s16le -f alsa -i hw:0,0 $out
test -s $out || ( rm $out; echo ffmpeg failed, try $0 -v; exit 1 )
echo "<video controls src=$out></video>" > $out.html
if test "$dest"
then
	today=$(date --iso-8601=date)
	rsync --progress --remove-source-files $out *.log $out.html $dest/$today/
	echo -e "\n\n\tSHARE: http://$(basename $dest)/$today/$out.html\n"
fi
