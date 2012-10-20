#!/bin/bash
out=${1:-out.webm}
res=$(xdpyinfo | grep 'dimensions:'|awk '{print $2}')
echo Capturing to $out ^C to stop
ffmpeg -loglevel quiet -f x11grab -s $res -i :0.0 -vcodec huffyuv -sameq -acodec pcm_s16le -f alsa -i hw:0,0 $out
echo "<video controls src=$out></video>" > $out.html
