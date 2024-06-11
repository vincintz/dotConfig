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

# Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Auto-complete
[ -x "$(command -v minikube)" ] && eval "$(minikube completion bash)"
[ -x "$(command -v kubectl)"  ] && eval "$(kubectl completion bash)"
[ -x "$(command -v poetry)"   ] && eval "$(poetry completions bash)"
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"
[ -x "$(command -v zoxide)"   ] && eval "$(zoxide init bash)"
[ -x "$(command -v fzf)"      ] && source /usr/share/doc/fzf/examples/key-bindings.bash
