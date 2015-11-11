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

# Load all of the config files in ~/.zsh/lib that end in .zsh
for config_file (~/.zsh/lib/*.zsh) source $config_file

# if [ "$TMUX" = "" ]; then tmux attach; fi
