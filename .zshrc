# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set options
setopt hist_ignore_all_dups share_history
setopt no_nomatch
setopt auto_cd

source $HOME/dotConfig/bindkey.zshrc
source $HOME/dotConfig/prompt.zshrc
source $HOME/dotConfig/alias.zshrc

if [[ $(uname -o) -eq "Cygwin" ]]; then
   source $HOME/dotConfig/cygwin/alias.zshrc
   source $HOME/dotConfig/cygwin/vars.zshrc
fi

# Load plugins from libs
for plugin in $HOME/dotConfig/libs/**/*.plugin.zsh; source $plugin
eval `dircolors $HOME/dotConfig/themes/dircolors-solarized/dircolors.256dark`
