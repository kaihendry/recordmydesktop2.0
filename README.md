# recordmydesktop 2.0

FFMPEG based scripts to record your Desktop or encoding videos for Web playback

	[hendry@t480s recordmydesktop2.0]$ ./x11capture
	./x11capture Capturing 2560x1440 to /home/hendry/recordmydesktop2.0/2018-09-28/1538128833.mkv  kill 4301 to kill capture or run ./x11capture again
	[hendry@t480s recordmydesktop2.0]$ ./x11capture
	Killed 4301 /home/hendry/recordmydesktop2.0/2018-09-28/1538128833.mkv
	[hendry@t480s recordmydesktop2.0]$ ./htmlvideo /home/hendry/recordmydesktop2.0/2018-09-28/1538128833.mkv
	ffmpeg version n4.0.2 Copyright (c) 2000-2018 the FFmpeg developers
	🎥 Duration: 8.7 seconds
	🎥 Input: 1.4M /home/hendry/recordmydesktop2.0/2018-09-28/1538128833.mkv Output: 308K 2018-09-28/1538128833.mp4 Space savings: 79%

* Authorative information about [how to record the desktop from ffmpeg](https://trac.ffmpeg.org/wiki/Capture/Desktop)
* Thanks to relaxed, ubitux, JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced) on Freenode's #ffmpeg

# Wayland

I created a wrapper called [record](https://github.com/kaihendry/dotfiles/blob/master/bin/record) around <https://github.com/ammen99/wf-recorder>
