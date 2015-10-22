# Created by newuser for 5.0.6
#

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

PS1=$'%{\e[0;37m%}%B%*%b %{\e[0;35m%}%m:%{\e[0;37m%}%~ %(!.#.>) %{\e[00m%}\n$ '
# PS1=$'%F{def}%(?..%B%K{red}[%?]%K{def}%b )%(1j.%b%K{yel}%F{bla}%jJ%F{def}%K{def} .)%F{white}%B%*%b %F{m}%m:%F{white}%~ %(!.#.>) %F{def}'

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors 2> /dev/null` ]]; then
        eval `dircolors -b`
        alias 'ls=ls --color=auto'
    fi
fi


# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Prompts for confirmation after 'rm *' etc
setopt RM_STAR_WAIT

# Why is the date American even when the locale is en_GB?  Fix with this
export TIME_STYLE="long-iso"

# Use modern completion system
autoload -Uz compinit
compinit

# Hostname completion
zstyle ':completion:*' hosts $( cat $HOME/.ssh/known_hosts )

# Load all of the config files in ~/.zsh/lib that end in .zsh
for config_file (~/.zsh/lib/*.zsh) source $config_file

# if [ "$TMUX" = "" ]; then tmux attach; fi
