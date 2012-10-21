#!/bin/bash -e

usage() {
cat $(readlink -f $(dirname $0))/README.md
}

codec="utvideo"
while getopts "o:d:vhu:c:" o
do
	case "$o" in
	(u) dest="$OPTARG";;
	(d) duration="-t $OPTARG";;
	(\?) echo "Invalid option: -$OPTARG" >&2 ;;
	(h) usage; exit;;
	(*) break;;
	esac
done
shift $((OPTIND - 1))
today=$(date --iso-8601=date)
mkdir $today &>/dev/null || true
out=$today/${1:-out.webm}
if test "${out##*.}" != "webm"; then out=$out.webm; fi
log=${out%.*}.log

temp=$(mktemp -u "/tmp/$0.XXXX.mkv")
temp2=$(mktemp  -u "/tmp/$0.XXXX.mkv")
trap "rm -f $today $temp $temp2 2>/dev/null; exit" EXIT

res=$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')
echo -e "\033[1;34m$0\033[m capturing $res to $out."
test "$duration" || echo Type q then enter to end your screencast

( set -x
ffmpeg $duration -f x11grab -s $res -r 30 -i :0.0 -f alsa -i hw:0,0 -acodec flac -vcodec ffvhuff $temp
ffmpeg -i $temp -acodec libvorbis $temp2
ffmpeg -i $temp2 -b:v 2000k -acodec copy -vcodec libvpx $out) 2>&1 | tee $log

# Generate HTML source
html=${out%.*}.html
echo "<video width=640 height=360 controls autoplay src=$(basename $out)></video><pre>" > $html

eval $(ffprobe -v 0 -of flat=s=_ -show_format $out) # trick to video info into shell

ffprobe -v warning -show_format $out >> $html
echo "</pre><p><a href=$(basename $log)>ffmpeg logfile</a></p><p><a href=https://github.com/kaihendry/recordmydesktop2.0/blob/master/r2d2.sh>r2d2.sh source</a></p>" >> $html

echo -e  "\033[1;34m$0\033[m captured $out, duration: $format_duration seconds"

if test "$dest"
then
	rsync -r --progress --remove-source-files $today $dest
	echo -e "\n\n\tSHARE: http://$(basename $dest)/$html\n"
fi
