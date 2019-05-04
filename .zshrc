source $HOME/dotConfig/common/history.zshrc
source $HOME/dotConfig/common/bindkey.zshrc
source $HOME/dotConfig/common/prompt.zshrc
source $HOME/dotConfig/common/alias.zshrc

if [[ $(uname -o) -eq "Cygwin" ]]; then
   source $HOME/dotConfig/cygwin/alias.zshrc
   source $HOME/dotConfig/cygwin/vars.zshrc
fi

# Set options
setopt no_nomatch
setopt auto_cd

# Load plugins from libs
for plugin in $HOME/dotConfig/libs/**/*.plugin.zsh; source $plugin
eval `dircolors $HOME/dotConfig/themes/dircolors-solarized/dircolors.256dark`
