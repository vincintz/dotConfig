# My personal dotConfig files


## Update system
```
sudo apt update && sudo apt upgrade -y
```

## Install programs

* Alacritty
   ```
   sudo add-apt-repository ppa:mmstick76/alacritty
   sudo apt install -y  alacritty
   ```

* Latest vim with clipboard support
   ```
   sudo add-apt-repository ppa:jonathonf/vim
   sudo apt install vim-gtk3
   ```

* Dev Essentials
   ```
   sudo apt install -y zsh tmux
   sudo apt install -y curl net-tools
   sudo apt install -y build-essential cmake python3-dev mysql-client
   sudo apt install -y ripgrep fd-find bat exuberant-ctags shellcheck
   ```

* Useful utilities
   ```
   sudo apt install ncdu mc pspg
   ```
   * manual install git-delta - https://dandavison.github.io/delta/installation.html

* Renames for ubuntu
   ```
   mkdir -p $HOME/.local/bin/
   ln -s $(which batcat) $HOME/.local/bin/bat
   ln -s $(which fdfind) $HOME/.local/bin/fd
   ```

## Install Plugins

* zsh plugins
   ```
   mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
   git clone https://github.com/Tarrasch/zsh-autoenv
   git clone https://github.com/zsh-users/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-history-substring-search
   ```

* tmux plugins
   ```
   git clone https://github.com/soyuka/tmux-current-pane-hostname ~/dotConfig/libs/tmux-current-pane-hostname
   git clone https://github.com/tmux-plugins/tmux-resurrect ~/dotConfig/libs/tmux-resurrect
   ```

* install YCM
  ```
  ( cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --ts-completer )
  ```

## Set Git configs

* credentials
   ```
   git config --global user.name "Theo Reyes"
   git config --global user.email "vincintz@yahoo.com"
   ```
* difftool
   ```
   git config --global diff.tool vimdiff
   git config --global difftool.prompt false
   ```
* alias
   ```
   git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
   git config --global alias.df "diff --compact-summary"
   git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
   ```

## Clone dotConfig
```
git clone https://github.com/vincintz/dotConfig
ln -s $HOME/dotConfig/.alacritty.yml $HOME/.alacritty.yml
ln -s $HOME/dotConfig/.zshrc $HOME/.zshrc
ln -s $HOME/dotConfig/.zshenv $HOME/.zshenv
ln -s $HOME/dotConfig/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotConfig/.vimrc $HOME/.vimrc
```
