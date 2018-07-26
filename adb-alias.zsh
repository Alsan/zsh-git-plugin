alias adb-clean='adb logcat | grep "$1" | sed "s/^I\/$1(.*):\s/log: /g" | sed "s/at file:.*$//g"'
alias adb-deviceid='adb shell settings get secure android_id'
alias adb-lcd-toggle='adb shell input keyevent 26'
alias adb-downgrade='adb install -r -d'
alias adb-list='adb shell pm list package -f | rev | cut -d= -f1 | rev'
alias adb-list-3rd-only='adb shell pm list package -f -3 | rev | cut -d= -f1 | rev'
alias adb-install='adb install -r'
alias adb-uninstall='adb shell pm uninstall -k'
alias adb-list-ime='adb shell ime list -s'
alias adb-show-ip='adb shell ip addr show wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1'

function adb-clipsend() {
	adb shell am startservice --es text "$1" com.mend.clipboardcopy/.ClipboardCopy
}

function adb-debug() {
	pid=$(adb shell ps | grep $1 | head -n 1 | awk -F" " '{print $2}')

	#[[ ! -z $pid ]] && adb logcat | grep $pid | /opt/pylib2.7/colored_logcat.py
	[[ ! -z $pid ]] && adb logcat | grep $pid
}

function adb-input() {
	if (( $# > 0 )); then
		adb shell ime set com.android.adbkeyboard/.AdbIME > /dev/null
		adb shell am broadcast -a ADB_INPUT_TEXT --es msg "$1" > /dev/null
	fi
}

function adb-ota() {
	adb tcpip 5555
	sleep 2
	adb connect $(adb shell ip addr show wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
}