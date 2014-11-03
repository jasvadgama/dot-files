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

# ALIASES
# file system
alias c="clear"
alias ll="ls -lah"

# DIRECTORY LINKS
alias ~="cd ~"
alias dev="cd ~/Sites/Dev"
alias github="cd ~/Sites/Github"
alias projects="cd ~/Sites/Projects"

# GITHUB
# git get (pull)
alias gg="git pull"
alias gb="git branch"
# create branch - % git branch -b new_branch_name branch_to_clone
function gcb {
    git checkout -b ${1} ${2}
}
# switch branch
function gsb {
    git checkout $@
}
alias gs="git status"
alias ga="git add -A"
# commit with message
function gc {
    git commit -m "${1}"
}
# push with optional branch location
function gp {
    git push $@
}
# tag a branch - % git tag -a 1.0 -m "making a release"
function gt {
    git tag -a ${1} -m "${2}"
}
# export zipfile - % git archive --format zip --output project.zip branch_name
function gitzip {
    git archive --format zip --output ${1}.zip ${2}
}
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