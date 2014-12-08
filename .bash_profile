# TERMINAL APPEARANCE
export PS1="\u@\W: "

# TERMINAL TOOLS
# bulk rename files - bulkrename extension search replacement
function bulkrename {
    for file in *$1
    do
        mv $file "${file/$2/$3}"
    done
}

# QUICK TASKS
alias c="clear"
alias ll="ls -lah"

# DIRECTORY LINKS
alias ~="cd ~"
alias dev="cd ~/Sites/Dev"
alias github="cd ~/Sites/Github"
alias projects="cd ~/Sites/Projects"

# GITHUB
# list changes
alias gs="git status"
# add all files
alias ga="git add -A"
# list local branches
alias gb="git branch"
# colourized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# create and switch to branch - % gcb new_branch_name branch_to_clone
function gcb {
    git checkout -b ${1} ${2}
}
# switch branch - % gsb develop
function gsb {
    git checkout $@
}
# git get (pull) - % git pull remote branch
function gg {
    git pull $@
}
# commit with message - % gc "initial commit"
function gc {
    git commit -m "${1}"
}
# push to remote - % git push remote branch
function gp {
    git push $@
}
# tag a branch - % gt version "making a release"
function gt {
    git tag -a $1 -m "${2}"
}
# export zipfile - % gitgitzip filename branch
function gitzip {
    git archive --format zip --output $1.zip $2
}

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
