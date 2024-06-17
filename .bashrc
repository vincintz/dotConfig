# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Command history settings
export HISTCONTROL=$HISTCONTROL:ignorespace
export HISTCONTROL=$HISTCONTROL:ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# check the window size after each command
shopt -s checkwinsize

# Enable colors
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

