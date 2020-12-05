# zmodload zsh/zprof

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
    source $HOME/dotConfig/cygwin/dircolors.zsh
fi

# Source OSX configs
[[ $OSTYPE == darwin* ]] && source $HOME/dotConfig/osx/nvm.zsh

# zprof | tee zprof1.out