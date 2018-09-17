alias startup-list='systemd-analyze blame'
alias service-list='sudo service --status-all'
alias flatpak-clean='flatpak uninstall --all'
alias pretty-json='python -m json.tool'
alias decode-unicode='ascii2uni -a U -q'

function sync-folder() {
	tar cSpf - . | (cd $1 ; tar xvSpf - )
}

function service-start() {
	sudo service $1 start
}

function service-status() {
	sudo service $1 status
}

function service-stop() {
	sudo service $1 stop
}

function service-enable() {
	sudo systemctl enable $1.service
}

function service-disable() {
	sudo systemctl disable $1.service
}
