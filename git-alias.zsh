function __get_is_inside_repo() {
	return "$(git rev-parse --is-inside-work-tree 2>/dev/null)"
}

alias add='git add'
alias add-all='git add -A'
alias amend='git commit --amend --no-edit'
alias amend-all='git commit -a --amend --no-edit'
alias branch='git branch'
alias checkout='git checkout'
alias clean='git clean -fd'
alias clone='git clone'
alias commit='git commit -m'
alias commit-all='git commit -am'
alias commit-amend-msg='git commit --amend -m'
alias config='git config'
alias delete='git rm'
alias feature='git flow feature start'
alias feature-complete='git fow feature finish'
alias fetch='git fetch'
alias fix='git flow bugfix start'
alias fixed='git flow bugfix finish'
alias flow='git flow'
alias forget='git rm --cached'
alias hotfix='git flow hotfix start'
alias hotfixed='git flow hotfix finish'
alias init='git init && git flow init -d'
alias log='git log --oneline --graph --decorate'
alias resolve='git mergetool'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias remote='git remote'
alias rebase='git rebase'
alias release='git flow release'
alias reset='git reset'
alias revert='git revert'
alias status='[ __get_is_inside_repo() ] && git status || status'
alias support='git flow support'
alias tag='git tag'
alias theirs='git pull -s recursive -X theirs'
alias ours='git pull -s recursive -X ours'

function diff() {
	if [ __get_is_inside_git_repo() ]; then
		if (( $# == 0 )); then
			git difftool
		else
			git difftool $@
		fi
	else
		command diff $1 $2
	fi
}

function gi() { 
	curl -L -s https://www.gitignore.io/api/\$@ ;
}

function ignore() {
	echo "$1" >> .gitignore
}
