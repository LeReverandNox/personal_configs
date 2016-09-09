# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/opt/android-studio/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export ANDROID_PLATFORM_TOOLS=~/Android/Sdk/platform-tools
export ANDROID_TOOLS=~/Android/Sdk/tools
export TELEGRAM=~/Apps/Telegram
export FRANZ=~/Apps/Franz
export PATH="$PATH:$ANDROID_HOME:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$TELEGRAM:$FRANZ"
export DEFAULT_USER=`whoami`

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias ls='ls -lFHh --color=auto'
function cd() {
    builtin cd $1
    \ls -FH --color=auto
}

function showmem() {
    ps -eo size,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' | grep -v grep | grep $1
}

function touchsubl() {
    touch "$1" &&
    subl $1
}
function mkcdir() {
    mkdir -p "$1" &&
    cd "$1"
}
alias emacs='emacs -nw'
alias nautilus='nautilus --no-desktop'
alias sc='cd ~/Dropbox/Prog/SamsungCampus/'
alias 42='cd ~/Dropbox/Prog/42/'
alias gdiff='git diff'

source ~/.zshrc_hosts

# Habiteo
fpath=(~/.oh-my-zsh/plugins/dbash $fpath)
fpath=(~/.oh-my-zsh/plugins/dockerbash $fpath)
alias drma="dockerrmall"
alias drm="dockerrmexited"
alias dcup="docker-compose up"
alias dcupd="docker-compose up -d"
alias dcdown="docker-compose down"
alias dpsa="watch -n 1 docker ps -a"
alias dbash="dockerbash"
alias dinspect="docker inspect"
alias dcbuild="docker-compose build"

function dockerrmall() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}

function dockerbash() {
    docker exec -ti $1 /bin/bash
}

function dockerrmexited() {
    docker rm $(docker ps -a | grep Exit | cut -d ' ' -f 1)
}
