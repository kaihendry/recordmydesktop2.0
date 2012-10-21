# recordmydesktop 2.0 - r2d2.sh

Usage: r2d2.sh [options] [output filename].webm

Options:

	-h this help
	-d duration in seconds
	-u upload host

Example:

	r2d2.sh -d 5 -u r2d2.webconverger.org:/srv/www/r2d2.webconverger.org

# TODO - Great HTML5 video experience

* Improve WebM content, good colours, duration is intact
* Ensure it works on IOS6 Safari, i.e. create [H264](http://en.wikipedia.org/wiki/H.264/MPEG-4_AVC) version
* Improve HTML output of `ffprobe` <http://ffmpeg.org/ffprobe.html#Writers>
	shell scripting, -of flat=s=_ makes possible to eval directly the variables 

# Further links

* <http://webconverger.org/screencasting>
* Need to capture regions in your screencast? See: <https://github.com/lolilolicon/FFcast2>
* Thanks to JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced)
