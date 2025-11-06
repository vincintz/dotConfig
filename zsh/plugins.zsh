# Load plugins from libs
if [[ -d "$XDG_CONFIG_HOME/zsh/libs" ]]; then
  for plugin in $XDG_CONFIG_HOME/zsh/libs/**/*.plugin.zsh; do
    source $plugin
  done
fi

