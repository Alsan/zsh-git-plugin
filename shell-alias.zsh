alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../../'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 'count-by-ext=find . -type f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e "s/.*\(\.[a-zA-Z0-9]*\)$/\1/" | sort | uniq -c | sort -n -r'
alias mount-iso='sudo mount -t iso9660 -o loop'
alias ping='ping -c 5'
alias rssh='ssh -R 10999:localhost:22'
alias top10-du='du -hsx * | sort -rh | head -10'
alias df='df -h'
alias du='du -h -c'
alias tmux='TERM=xterm-256color \tmux'

# emulate bash PROMPT_COMMAND (only for zsh)
precmd() { eval "$PROMPT_COMMAND" }
# open new terminal in same dir
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"

function mcd () {
	mkdir -p "$1" && cd "$1"
}

function mount-share() {
	if (( $# != 3 )); then
		echo "syntax: mount-share [share location] [login user] [logoin password]"
		return 1
	fi

	sudo mount -t cifs "//$1" -o username="$2",password="$3",gid=1000,uid=1000 ~/mount/share
}

function psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "!! Need name to grep for"
	fi
}

function portslay () {
	kill -9 `lsof -i tcp:$1 | tail -1 | awk '{ print $2;}'`
}

function killit() {
	# Kills any process that matches a regexp passed to it
	ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

function external-ip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

function ip-list() {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

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

function dls () {
	# directory LS
	echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

function dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

function dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}
