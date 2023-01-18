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

* Others
   ```
   sudo apt install -y zsh tmux
   sudo apt install -y curl net-tools
   sudo apt install -y build-essential cmake python3-dev
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

* vim plugin dependenies
  ```
  wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb && dpkg -i fd_8.2.1_amd64.deb
  wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb && dpkg -i bat_0.17.1_amd64.deb
  wget https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb && dpkg -i ripgrep_12.1.1_amd64.deb
  rm ripgrep_12.1.1_amd64.deb bat_0.17.1_amd64.deb fd_8.2.1_amd64.deb

  wget https://github.com/junegunn/fzf/releases/download/0.25.1/fzf-0.25.1-linux_amd64.tar.gz
  tar xf fzf-0.25.1-linux_amd64.tar.gz
  mv fzf /usr/local/bin/
  rm fzf-0.25.1-linux_amd64.tar.gz

  apt install exuberant-ctags
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
   git confif --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
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
