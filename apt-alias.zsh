alias apt-list-installed="sudo dpkg --get-selections | awk '{print \$1}'"

function apt-repo-update() {
	sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/$1" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
}

function dpkg-find() {
	dpkg -S $(which $1)
}

function dpkg-size() {
	dpkg-query --show --showformat='${Package;-50}\t${Installed-Size}\n' `aptitude --display-format '%p' search '?installed!?automatic'` | sort -k 2 -rn | grep -v deinstall | awk '{printf "%.3f MB \t %s\n", $2/(1024), $1}'
}