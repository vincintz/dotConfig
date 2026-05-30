# Load plugins from libs
if [[ -d "$XDG_CONFIG_HOME/zsh/libs" ]]; then
  for plugin in $XDG_CONFIG_HOME/zsh/libs/**/*.plugin.zsh; do
    source $plugin
  done
fi

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
