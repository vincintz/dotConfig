# source configs
source $XDG_CONFIG_HOME/zsh/plugins.zsh
source $XDG_CONFIG_HOME/zsh/history.zsh
source $XDG_CONFIG_HOME/zsh/bindkey.zsh
source $XDG_CONFIG_HOME/zsh/alias.zsh
source $XDG_CONFIG_HOME/zsh/envs.zsh
source $XDG_CONFIG_HOME/zsh/options.zsh
source $XDG_CONFIG_HOME/zsh/autocomplete.zsh
source $XDG_CONFIG_HOME/zsh/evals.zsh

# source extra configs
# note: add zsh settings here
[ -f "$XDG_CONFIG_HOME/zsh/extra.zsh" ] && source $XDG_CONFIG_HOME/zsh/extra.zsh
