# PROMPT
# seasonal chevron colours
chevrons () {
  local date=$(date)
  local chevrons="❯❯❯"

  case $date in
    # spring
    *Mar*|*Apr*|*May*)
      chevrons="%F{cyan}❯%F{green}❯%F{yellow}❯%f"
      ;;
    # summer
    *Jun*|*Jul*|*Aug*)
      chevrons="%F{green}❯%F{yellow}❯%F{red}❯%f"
      ;;
    # fall
    *Sep*|*Oct*|*Nov*)
      chevrons="%F{yellow}❯%F{red}❯%F{magenta}❯%f"
      ;;
    # winter
    *Dec*|*Jan*|*Feb*)
      chevrons="%F{magenta}❯%F{cyan}❯%F{green}❯%f"
      ;;
    *)
      ;;
  esac

  echo -en $chevrons
}
# get the current folder
current_folder () {
  echo '%F{green}%1d%f'
}

setopt PROMPT_SUBST
export PS1; PS1='$(current_folder) $(chevrons) '

# GIT RPROMPT
# return the branch name if we're in a git repo, or nothing otherwise.
git_check () {
  local gitBranch=$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")
  if [[ $gitBranch ]]; then
    echo -en $gitBranch
    return
  fi
}
# return the status of the current git repo.
git_status () {
  local gitBranch="$(git_check)"
  if [[ $gitBranch ]]; then
    local statusCheck=$(git status 2> /dev/null)
    if [[ $statusCheck =~ 'Your branch is ahead' ]]; then
      echo -en 'ahead'
    elif [[ $statusCheck =~ 'Changes to be committed' ]]; then
      echo -en 'staged'
    elif [[ $statusCheck =~ 'no changes added' ]]; then
      echo -en 'modified'
    elif [[ $statusCheck =~ 'working tree clean' ]]; then
      echo -en 'clean'
    fi
  fi
}
# return a color based on the current git status.
git_status_color () {
  local gitStatus="$(git_status)"
  local statusText=''
  case $gitStatus in
    clean*)
      statusText="green"
      ;;
    modified*)
      statusText="magenta"
      ;;
    staged*)
      statusText="yellow"
      ;;
    ahead*)
      statusText="cyan"
      ;;
    *)
      statusText="white"
      ;;
  esac
  echo -en $statusText
}
# print a label for the current git branch if it isn't master.
git_branch () {
  local gitBranch="$(git_check)"
  if [[ $gitBranch && ! $gitBranch == 'master' && $COLUMNS -gt 79 ]]; then
    echo -en "%F{"$(git_status_color)"}$gitBranch%f"
  fi
}
export RPROMPT='$(git_branch)'

# QUICK TASKS
alias c="clear"
alias ll="ls -lah"
alias weather="curl -4 http://wttr.in/"

# DIRECTORY LINKS
alias ~="cd ~"
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
alias gg="git pull"
# list changes
alias gs="git status"
# add all files
alias ga="git add -A"
# commit with message and optional flags (e.g. --no-verify)
# % gc "chore: updating deps (WIP)" --no-verify
function gc {
  git commit -m "${1}" $2
}
# push to remote
alias gp="git push"

# list local branches
alias gb="git branch"
# create and switch to a new branch - % git checkout -b new_branch source_branch
# % gcb chore/update-deps main
function gcb {
  git checkout -b $@
}
# switch branch - % git checkout branch
# gsb main
function gsb {
  git checkout $@
}
# safe merge a branch - % git merge --no-commit --no-ff branch
# % gsm main
function gsm {
  git merge --no-commit --no-ff $@
}
# remove local branch - % git branch -D branch
# % gdb chore/update-deps
function gdb {
  git branch -D $@
}

# tag a branch - % git tag -a 1.0
# % gt 1.0.0 "Release"
function gt {
  git tag -a $1 -m $2
}
# push tags to origin
alias gptags="git push origin --tags"

# export zipfile - % git archive --format zip --output filename.zip branch
# % gitzip main main
function gitzip {
  git archive --format zip --output $1.zip $2
}

# colourized git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# delete local marged branches
alias gbclean="git branch --merged | grep -v "\*" | xargs -n 1 git branch -d"

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

# CHROME (FOR HEADLESS)
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# PYTHON
# start a server in the cwd - % startServer -p 8080
function startServer {
  # grab the flags
  while getopts ":p:" opt; do
    case $opt in
      p)
        p=$OPTARG
        ;;
    esac
  done

  # if -p is not defined
  if [ -z "${p}" ]; then
    # default to origin
    r="8080"
  fi

  python3 -m http.server $p
}

# NPM
# Make NPM install in the home dir
export PATH="$PATH:$HOME/.npm-global/bin"
export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
# export NODE_ENV=development

# PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Add Flutter to PATH
export PATH="$PATH:/Users/jasalvadgama/Sites/flutter/bin"
