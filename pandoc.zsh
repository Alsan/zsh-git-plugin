function md2slide() {
	full_path="$1"
	filename="${full_path#.}"
	filename="${full_path%"$filename"}${filename%.*}"
	filename="${2:-$filename}"
	revealjs_path="${3:-$filename/reveal-js}"
	width=${4:-1440}
	height=${5:-900}

	echo "full_path=$full_path"
	echo "filename=$filename"
	echo "revealjs_path=$revealjs_path"
	echo "width=$width"
	echo "height=$height"

	pandoc -s \
		   -t revealjs \
	       -V revealjs-url="$revealjs_path" \
	       -V theme=solarized \
	       -V transition=cube \
	       -V width=$width \
	       -V height=$height \
	       -o "$filename.html" \
	       "$full_path"
}

function md2slide-hd() {
	md2slide $1 $2 $3 3200 1800
}

function md2slide-ld() {
	md2slide $1 $2 $3 1024 768
}
