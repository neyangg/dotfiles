export EDITOR='vim'
export HADOOP_HOME="/home/neyangg/hadoop-2.7.3/"
export JAVA_HOME="/usr/local/jdk1.7.0_79"
export JRE_HOME="/usr/local/jdk1.7.0_79/jre"
export PATH="/home/neyangg/anaconda3/bin/:$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:/usr/local/jdk1.7.0_79/bin:/usr/local/jdk1.7.0_79/jre/bin"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# My custom theme
ZSH_THEME="brian"

# Reload ZSH Config
alias reload='. ~/.zshrc'

# System
alias df='df -h'
alias cls='clear'

# ls
alias ls="ls -GF"
alias l="ls -Glah"
alias la='ls -GA'

# tree with color and hidden files
alias tree="tree -Ca"

# tmux
alias tmux='tmux -2'

# mysql
alias sql=mysql -u root -p

# VIM
alias vi='vim'
alias vf='vim -f'

# git
alias gl='git pull'
alias glo='git pull origin master'
alias gp='git push'
alias gpo='git push origin master'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias go='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
