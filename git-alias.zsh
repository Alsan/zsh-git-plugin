function __get_is_inside_repo() {
	return "$(git rev-parse --is-inside-work-tree 2>/dev/null)"
}

alias add='git add'
alias add.all='git add -A'
alias amend='git commit --amend --no-edit'
alias amend.all='git commit -a --amend --no-edit'
alias blame='git blame'
alias branch='git branch'
alias bugfix='git flow bugfix start'
alias bugfix.done='git flow bugfix finish'
alias checkout='git checkout'
alias clean='git clean -fd'
alias clone='git clone'
alias commit='git commit -m'
alias commit.all='git commit -am'
alias commit.amend.msg='git commit --amend -m'
alias config='git config'
alias delete='git rm'
alias feature='git flow feature start'
alias feature.done='git fow feature finish'
alias fetch='git fetch'
alias forget='git rm --cached'
alias hotfix='git flow hotfix start'
alias hotfix.done='git flow hotfix finish'
alias init='git init && git flow init -d'
alias log='git log --oneline --graph --decorate'
alias log.detail='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s%Cgreen(%cr) %C(bold blue)%Creset"'
alias resolve='git mergetool'
alias merge='git merge'
alias prune='git fetch --prune'
alias pull='git pull'
alias push='git push'
alias remote='git remote'
alias rebase='git rebase'
alias release='git flow release start'
alias release.done='git flow release finish'
alias reset='git reset'
alias revert='git revert'
alias stash.all='git save --include-untracked'
alias status='[ __get_is_inside_repo() ] && git status || status'
alias support='git flow support start'
alias support.done='git flow support finish'
alias tag='git tag'
alias theirs='git pull -s recursive -X theirs'
alias undo='reset --soft HEAD ^'
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

function ignore() {
	echo "$1" >> .gitignore
}
