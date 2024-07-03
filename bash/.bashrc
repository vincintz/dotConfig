# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Command history settings
export HISTCONTROL=$HISTCONTROL:ignorespace
export HISTCONTROL=$HISTCONTROL:ignoredups
export HISTCONTROL=$HISTCONTROL:erasedups
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
shopt -s histappend

# check the window size after each command
shopt -s checkwinsize
shopt -s histappend

# Enable colors
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# exports
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:$HOME/.local/bin

export PATH=$PATH:$HOME/.local/bin

# Auto-complete
source /etc/bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
