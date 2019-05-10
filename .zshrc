# Load plugins from libs
for plugin in $HOME/dotConfig/libs/**/*.plugin.zsh; do
    source $plugin
done

# Source common configs
source $HOME/dotConfig/common/history.zsh
source $HOME/dotConfig/common/bindkey.zsh
source $HOME/dotConfig/common/prompt.zsh
source $HOME/dotConfig/common/alias.zsh
source $HOME/dotConfig/common/options.zsh
source $HOME/dotConfig/common/autocomplete.zsh

# Source cygwin configs
if [[ $OSTYPE == "cygwin" ]]; then
    source $HOME/dotConfig/cygwin/alias.zsh
    source $HOME/dotConfig/cygwin/vars.zsh
fi

# Set dir colots
d=$HOME/dotConfig/.dircolors
[[ -f $d ]] && eval `dircolors $d`
