# zmodload zsh/zprof

# Load plugins from libs
for plugin in $HOME/dotConfig/zsh/libs/**/*.plugin.zsh; do
    source $plugin
done

# Source common configs
source $HOME/dotConfig/zsh/common/history.zsh
source $HOME/dotConfig/zsh/common/bindkey.zsh
source $HOME/dotConfig/zsh/common/alias.zsh
source $HOME/dotConfig/zsh/common/options.zsh
source $HOME/dotConfig/zsh/common/autocomplete.zsh
source $HOME/dotConfig/zsh/common/nvm.zsh

# Source cygwin configs
if [[ $OSTYPE == "cygwin" ]]; then
    source $HOME/dotConfig/zsh/cygwin/alias.zsh
    source $HOME/dotConfig/zsh/cygwin/vars.zsh
    source $HOME/dotConfig/zsh/cygwin/dircolors.zsh
# Source OSX configs
elif [[ $OSTYPE == darwin* ]]; then
    source $HOME/dotConfig/zsh/osx/envs.zsh
    source $HOME/dotConfig/zsh/osx/nvm.zsh
    source $HOME/dotConfig/zsh/osx/rprompt.zsh
# Source Linux configs
elif [[ $OSTYPE == linux* ]]; then
    source $HOME/dotConfig/zsh/linux/envs.zsh
    source $HOME/dotConfig/zsh/linux/bindkey.zsh
    source $HOME/dotConfig/zsh/linux/alias.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# other bash complete
[ -x "$(command -v minikube)"   ] && eval "$(minikube completion zsh)"
[ -x "$(command -v kubectl)"    ] && eval "$(kubectl completion zsh)"
# [ -x "$(command -v poetry)"     ] && eval "$(poetry completions zsh)"
[ -x "$(command -v starship)"   ] && eval "$(starship init zsh)"
[ -x "$(command -v zoxide)"     ] && eval "$(zoxide init zsh)"
[ -x "$(command -v fzf)"        ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# homebrew
[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
