# TERMINAL APPEARANCE
export PS1="\u@\W: "

# ALIASES
# quick directory links
alias dev="cd ~/Sites/Dev"
alias github="cd ~/Sites/Github"

# export git repo
alias gitzip="git archive --format zip --output project.zip master"

# apache config
alias hosts="subl /etc/hosts"
alias vhosts="subl /etc/apache2/extra/httpd-vhosts.conf"

# FINDER
# restart Finder
alias restartfinder="killall Finder"
# show hidden files
alias showfiles='defaults write com.apple.finder AppleShowAllFiles TRUE'
# hide 'hidden' files
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles FALSE'