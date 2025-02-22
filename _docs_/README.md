# My personal dotConfig files


## Update system
```
sudo apt update && sudo apt upgrade -y
```

## Install programs

* Alacritty
   ```
   sudo add-apt-repository ppa:mmstick76/alacritty
   sudo apt install -y alacritty
   ```

* Latest vim with clipboard support
   ```
   sudo add-apt-repository ppa:jonathonf/vim
   sudo apt install vim-gtk3
   ```

* Dev Essentials
   ```
   sudo apt install -y zsh tmux fzf nala
   sudo apt install -y curl net-tools nmap
   sudo apt install -y ripgrep fd-find bat exuberant-ctags shellcheck

   sudo apt install -y build-essential cmake python3-dev mysql-client
   ```

* Python3 tools
  ```
  sudo apt install -y isort black
  ```

* Useful utilities
   ```
   sudo apt install -y ncdu mc pspg
   ```
   * manual install git-delta - https://dandavison.github.io/delta/installation.html

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

## Install Plugins

* zsh plugins
   ```
   mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
   git clone https://github.com/Tarrasch/zsh-autoenv
   git clone https://github.com/zsh-users/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-history-substring-search
   git clone https://github.com/jeffreytse/zsh-vi-mode
   ```

* tmux plugins
   ```
   git clone https://github.com/soyuka/tmux-current-pane-hostname ~/dotConfig/libs/tmux-current-pane-hostname
   git clone https://github.com/tmux-plugins/tmux-resurrect ~/dotConfig/libs/tmux-resurrect
   ```
