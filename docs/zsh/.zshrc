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
source $HOME/dotConfig/common/nvm.zsh

# Source cygwin configs
if [[ $OSTYPE == "cygwin" ]]; then
    source $HOME/dotConfig/cygwin/alias.zsh
    source $HOME/dotConfig/cygwin/vars.zsh
    source $HOME/dotConfig/cygwin/dircolors.zsh
# Source OSX configs
elif [[ $OSTYPE == darwin* ]]; then
    source $HOME/dotConfig/osx/envs.zsh
    source $HOME/dotConfig/osx/nvm.zsh
    source $HOME/dotConfig/osx/rprompt.zsh
# Source Linux configs
elif [[ $OSTYPE == linux* ]]; then
    source $HOME/dotConfig/linux/envs.zsh
    source $HOME/dotConfig/linux/bindkey.zsh
    source $HOME/dotConfig/linux/alias.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
