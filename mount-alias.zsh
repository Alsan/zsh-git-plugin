alias mount-iso='sudo mount -t iso9660 -o loop'

function mount-share() {
	if (( $# != 3 )); then
		echo "syntax: mount-share [share location] [login user] [logoin password]"
		return 1
	fi

	sudo mount -t cifs "//$1" -o username="$2",password="$3",gid=1000,uid=1000 ~/mount/share
}
