# TERMINAL APPEARANCE
export PS1="\u@\W: "

# ALIASES
# file system
alias c="clear"
alias ll="ls -alh"

# quick directory links
alias dev="cd ~/Sites/Dev"
alias github="cd ~/Sites/Github"

# export git repo
alias gitzip="git archive --format zip --output project.zip master"

# apache config
alias hosts="subl /etc/hosts"
alias vhosts="subl /etc/apache2/extra/httpd-vhosts.conf"

# FINDER
# show hidden files
function sf {
	defaults write com.apple.finder AppleShowAllFiles TRUE
	killall Finder
}
# hide hidden files
function hf {
	defaults write com.apple.finder AppleShowAllFiles FALSE
	killall Finder
}