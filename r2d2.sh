#!/bin/bash -e

usage() {
cat $(readlink -f $(dirname $0))/README.md
}

verbose="-v warning"
codec="utvideo"
while getopts "o:d:vhu:c:" o
do
	case "$o" in
	(u) dest="$OPTARG";;
	(d) duration="-t $OPTARG";;
	(\?) echo "Invalid option: -$OPTARG" >&2 ;;
	(h) usage; exit;;
	(v) verbose="";; # funnily ffmpeg is verbose by default
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
test "$verbose" || echo -e "\033[1;34m$0\033[m $temp"
trap "rm -f $today $temp 2>/dev/null; exit" EXIT

res=$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')
echo -e "\033[1;34m$0\033[m capturing $res to $out."
test "$duration" || echo -e "\033[1;34m$0\033[m Type q then enter to end your screencast"

( set -x
ffmpeg $verbose $duration -f x11grab -s $res -r 30 -i :0.0 -f alsa -i hw:0,0 -acodec flac -vcodec ffvhuff $temp
# For Apple IOS Safari
if ! ffmpeg $verbose -y -i $temp -c:v libx264 -vpre ipod640 -acodec libfaac ${out%.*}.mp4
then
	echo -e "\033[1;34m$0\033[m you need to recompile ffmpeg to enable non-free libfaac :("
	echo https://bugs.archlinux.org/task/27465
fi
# For everything else
ffmpeg $verbose -y -i $temp -c:a libvorbis -q:a 7 -c:v libvpx -b:v 2000k $out) 2>&1 | tee $log
# Tweakables
# -b:v 3000k	bit rate aiming to get a clear view of the desktop
# -q:a 7	audio quality

# Generate HTML source
html=${out%.*}.html

cat <<END > $html
<video controls width=640 height=360 controls autoplay>
  <source src="$(basename ${out%.*}.mp4)" type="video/mp4">
  <source src="$(basename $out)" type="video/webm">
</video><pre>
END

eval $(ffprobe -v 0 -of flat=s=_ -show_format $out) # neat trick to get video variables into shell

ffprobe -v warning -show_format ${out%.*}.mp4 >> $html
ffprobe -v warning -show_format $out >> $html
echo "</pre><p><a href=$(basename $log)>ffmpeg logfile</a></p><p><a href=https://github.com/kaihendry/recordmydesktop2.0/blob/master/r2d2.sh>r2d2.sh source</a></p>" >> $html

echo -e  "\033[1;34m$0\033[m captured $(du -h $out) $(du -h ${out%.*}.mp4), duration: $format_duration seconds"

if test "$dest"
then
	rsync -r --progress --remove-source-files $today $dest
	echo -e "\n\n\033[1;34m$0\033[m SHARE URL: http://$(basename $dest)/$html\n"
fi
