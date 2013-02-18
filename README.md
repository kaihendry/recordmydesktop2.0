# recordmydesktop 2.0

**REQUIREMENTS**: [FFMPEG](http://ffmpeg.org/) >= 1.0 -- [static builds of
ffmpeg](http://ffmpeg.gusari.org/static/) are good for processing, however they
do not support x11grab currently and `xdpyinfo` from xorg-xdpyinfo package in
Archlinux.

Aims to be a better tool than
[recordmydesktop](http://en.wikipedia.org/wiki/RecordMyDesktop) for creating
screencasts from Archlinux (typically) to HTML5 video using .webm (For Firefox)
and .mp4 (H264) for Apple.

If you run `htmlvideo` upon an already existing mov or mp4 file, it will create
/ process the HTML, MP4 & WEBM for HTML viewing, so you can think of this tool
like `ffmpeg2theora`.

# Incorporating audio recording from another source like your iPhone & headphones mic

<img width="128" height="227" src="http://r2d2.webconverger.org/2012-10-27/voice-recorder.png" alt="ios6 voice recorder" />

Video: <http://youtu.be/_bp5N76puEQ>

This is a good method requiring some careful synchronization to ensure clear
sound without the noise from your PC's microphone.

	x11capture

whilst simultaneously hitting the red button of your voice recorder. q & enter
and stop the voice recorder at the same time.

The audio file in this example is `a.m4a` and to merge it in, use something
like:

	ffmpeg -i rawfYuV.mkv -i a.m4a -map 0:0 -map 1 -vcodec copy -acodec copy output.mkv

And now finish off the process with:

	htmlvideo output.mkv

# Convert old videos to HTML5 video formats

Same principle as `ffmpeg2theora`.

	htmlvideo GOPR0940.MP4

or on a server

	htmlvideo b.mov

# How to record yourself if you have a Webcam in your laptop

Using [guvcview](http://r2d2.webconverger.org/2012-11-15/guvcview.html).

# TODO - Great HTML5 video experience

* Improve HTML output using `ffprobe` <http://ffmpeg.org/ffprobe.html#Writers>
* looking into `mkvmerge` from the mkvtoolnix-cli package for editing the raw

# Furthermore

* Thanks to Burek, for his sane [static builds of ffmpeg](http://ffmpeg.gusari.org/static/)
* Thanks to ubitux, JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced) on Freenode's #ffmpeg
* <http://webconverger.org/screencasting>
* Need to capture regions in your screencast? See: <https://github.com/lolilolicon/FFcast2>
