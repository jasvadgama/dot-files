# TERMINAL APPEARANCE
export PS1="\u@\W: "

# QUICK TASKS
alias c="clear"
alias ll="ls -lah"

# DIRECTORY LINKS
alias ~="cd ~"
alias dev="cd ~/Sites/Dev"
alias github="cd ~/Sites/Github"
alias projects="cd ~/Sites/Projects"

# GITHUB
# git get (pull) - % git pull (remote branch)
function gg {
    git pull $@
}
# list changes
alias gs="git status"
# add all files
alias ga="git add -A"
# commit with message
function gc {
    git commit -m "${1}"
}
# push to remote - % git push remote branch
function gp {
    git push $@
}
# tag a branch - % git tag -a 1.0 -m "making a release"
function gt {
    git tag -a $1 -m "${2}"
}
# list local branches
alias gb="git branch"
# create and switch to a new branch - % git branch -b new_branch source_branch
function gcb {
    git branch -b $@
}
# switch branch - % git checkout branch
function gsb {
    git checkout $@
}
# export zipfile - % git archive --format zip --output filename.zip branch
function gitzip {
    git archive --format zip --output $1.zip $2
}
# colourized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# APACHE CONFIG
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
