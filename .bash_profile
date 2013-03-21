# TERMINAL APPEARANCE
export PS1="\u@\W: "

# ALIASES
# file system
alias c="clear"
alias ll="ls -alh"

# quick directory links
alias ~="cd ~"
alias Dev="cd ~/Sites/Dev"
alias Github="cd ~/Sites/Github"
alias Projects="cd ~/Sites/Projects"

# github
# git get (pull)
alias gg="git pull"
alias gb="git branch"
# create branch
function gcb {
	git branch $@
}
# switch branch
function gsb {
	git checkout $@
}
alias gs="git status"
alias ga="git add -A"
# commit all with message
function gc {
	git commit -am "${1}"
}
# push with optional branch location
function gp {
	git push $@
}
# export zipfile
alias gitzip="git archive --format zip --output project.zip master"
# colourized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# apache config
alias hosts="subl /etc/hosts"
alias vhosts="subl /etc/apache2/extra/httpd-vhosts.conf"

# FINDER
# show hidden files
function sf {
	defaults write com.apple.finder AppleShowAllFiles TRUE
	killall Finder
	echo "Files now showing"
}
# hide hidden files
function hf {
	defaults write com.apple.finder AppleShowAllFiles FALSE
	killall Finder
	echo "Files now hidden"
}