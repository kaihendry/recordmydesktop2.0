# recordmydesktop 2.0 - r2d2.sh

A better tool than
[recordmydesktop](http://en.wikipedia.org/wiki/RecordMyDesktop) for creating
screencasts from Archlinux (typically) to HTML5 video using .webm and .mp4 for
Apple

Usage: r2d2.sh [options] [output filename].webm

Options:

	-h this help
	-v verbose
	-n do not create non-free mp4 for Apple devices
	-d duration in seconds
	-u upload host

Examples:

Records to $today/out.{webm,mp4} You need to enter [q] to finish the recording.

	r2d2.sh

Take a 5 second capture to 5seconds.{webm,mp4} and upload to r2d2.webconverger.org:/srv/www/r2d2.webconverger.org

	r2d2.sh -d 5 -u r2d2.webconverger.org:/srv/www/r2d2.webconverger.org 5seconds

# TODO - Great HTML5 video experience

* Tweak WebM content, good colours, try get duration fine
* Figure out how to get seeking working across browsers
* Figure out why webm is 3x the size of mp4
* Improve HTML output using `ffprobe` <http://ffmpeg.org/ffprobe.html#Writers>
* Report issues to ffmpeg like:
	-t is not an input option, keeping it for the next output; consider fixing your command line.

# Furthermore

* For Apple compatible MP4s, you need to ensure ffmpeg is compiled with [--enable-nonfree --enable-libfaac](https://bugs.archlinux.org/task/27465)
* Thanks to ubitux, JEEB & [klaxa](https://gist.github.com/7dcccbd86fdcce3c4ced) on Freenode's #ffmpeg
* <http://webconverger.org/screencasting>
* Need to capture regions in your screencast? See: <https://github.com/lolilolicon/FFcast2>
