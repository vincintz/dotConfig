# Enable autocompletions
autoload -Uz compinit
# Use cache for compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
    compinit -i
else
    compinit -C -i
fi

zmodload -i zsh/complist

zstyle ':completion:*' menu select # select completions with arrow keys
# group results by category
zstyle ':completion:*' group-name ''
# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

