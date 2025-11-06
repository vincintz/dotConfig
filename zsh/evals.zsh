[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -x "$(command -v starship)"   ] && eval "$(starship init zsh)"
[ -x "$(command -v zoxide)"     ] && eval "$(zoxide init zsh)"
[ -x "$(command -v fzf)"        ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
