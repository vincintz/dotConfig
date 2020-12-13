TERM=xterm-256color

# Source cygwin environment variables
if [[ $OSTYPE == "cygwin" ]]; then
    source $HOME/dotConfig/cygwin/envs.zsh
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
