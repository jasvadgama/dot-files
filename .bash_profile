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

# ARCHIVES
# create a new zip archive - % zipup example.zip file1 file2 file3
function zipup {
    ARCHIVE=$1
    shift;
    FILES=$@
    tar -cvzf $ARCHIVE $FILES
}
# unzip an archive - % unzip archive.zip -C ./path/to/folder/
function unzip {
    tar -xvzf $1 -C $2
}

# TERMINAL TOOLS
# bulk rename files - bulkrename extension search replacement
function bulkrename {
    for file in *$1
    do
        mv $file "${file/$2/$3}"
    done
}

# GITHUB
# git get (pull) - % git pull [remote branch]
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
# push to remote - % git push [-r remote] [-b branch]
function gp {
    # grab the flags
    while getopts ":r::b:" opt; do
        case $opt in
            r)
                r=$OPTARG
                ;;
            b)
                b=$OPTARG
                ;;
        esac
    done

    # if -r is not defined
    if [ -z "${r}" ]; then
        # default to origin
        r="origin"
    fi

    # if -b is not defined
    if [ -z "${b}" ]; then
        # default to the current branch
        b=$(git symbolic-ref --short -q HEAD)
    fi

    git push $r $b

    # reset the vars to empty otherwise they persist
    r=""
    b=""
}
# tag a branch - % git tag -a 1.0 -m "making a release"
function gt {
    git tag -a $1 -m "${2}"
}
# push tags to origin
alias gptags="git push origin --tags"
# list local branches
alias gb="git branch"
# create and switch to a new branch - % git checkout -b new_branch source_branch
function gcb {
    git checkout -b $@
}
# switch branch - % git checkout branch
function gsb {
    git checkout $@
}
# safe merge a branch - % git merge --no-commit --no-ff branch
function gsm {
    git merge --no-commit --no-ff $@
}
# export zipfile - % git archive --format zip --output filename.zip branch
function gitzip {
    git archive --format zip --output $1.zip $2
}
# colourized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# APACHE CONFIG
alias hosts="sudo code /etc/hosts"
alias vhosts="sudo code /etc/apache2/extra/httpd-vhosts.conf"

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

# PYTHON
# start a server in the cwd
alias startServer="python -m SimpleHTTPServer 8080"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"

# NPM
# Make NPM install in the home dir
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# PATH
# mongodb
export PATH="$PATH:/usr/local/mongodb/bin"
