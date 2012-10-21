# recordmydesktop 2.0 - r2d2.sh

Usage: r2d2.sh [options] [output filename].webm

Options:

	-h this help
	-v verbose
	-d duration in seconds
	-u upload host

Example:

	r2d2.sh -d 5 -u r2d2.webconverger.org:/srv/www/r2d2.webconverger.org

Overwrites to out.webm be default.

# TODO - Great HTML5 video experience

* Improve WebM content, good colours, try get duration fine
* Ensure it works on IOS6 Safari, i.e. create [H264](http://en.wikipedia.org/wiki/H.264/MPEG-4_AVC) version
* Improve HTML output of `ffprobe` <http://ffmpeg.org/ffprobe.html#Writers>

# Furthermore

* Thanks to ubitux, JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced) on Freenode's #ffmpeg
* <http://webconverger.org/screencasting>
* Need to capture regions in your screencast? See: <https://github.com/lolilolicon/FFcast2>
