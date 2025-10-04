# Enable autocompletions
autoload -Uz compinit
compinit -i

zmodload -i zsh/complist

# select completions with arrow keys
zstyle ':completion:*' menu select
# group results by category
zstyle ':completion:*' group-name ''
# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

