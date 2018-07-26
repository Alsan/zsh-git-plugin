alias top10-du='du -hsx * | sort -rh | head -10'

function top-du() {
	BASEDIR=$1;
	TOPN=$2;

	if [ -z $BASEDIR ]; then
		BASEDIR=".";
	fi

	if [ -z $TOPN ]; then
		TOPN=10;
	fi

	du -a $BASEDIR | sort -n -r | head -n $TOPN
}

function top10-memory() {
	ps axo rss,comm,pid \
	| awk '{ proc_list[$2] += $1; } END \
	{ for (proc in proc_list) { printf("%d\t%s\n", proc_list[proc],proc); }}' \
	| sort -n | tail -n 10 | sort -rn \
	| awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
}