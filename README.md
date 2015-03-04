# recordmydesktop 2.0

**REQUIREMENTS**: [FFMPEG](http://ffmpeg.org/) >= 2.5

[Pulseaudio](http://www.freedesktop.org/wiki/Software/PulseAudio/) and
`pavucontrol` - like it or not, it's the only sane way to manage complex
recordings:

	pactl load-module module-loopback

Suffering from noise whilst recording? Have a look at this [fantastic noise
reducing tip for
pulseaudio](http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-March/023306.html).

# Convert old videos to (safari) Web friendly MP4

Same principle as `ffmpeg2theora`.

	htmlvideo GOPR0940.MP4

# How to record yourself if you have a Webcam in your laptop

	gst-launch-1.0 v4l2src ! xvimagesink

or

	vlc v4l2:///dev/video0

# Furthermore

* Authorative information about [how to record the desktop from ffmpeg](https://trac.ffmpeg.org/wiki/Capture/Desktop)
* Thanks to relaxed, ubitux, JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced) on Freenode's #ffmpeg
