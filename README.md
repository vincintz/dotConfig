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

* Latest vim
   ```
   sudo add-apt-repository ppa:jonathonf/vim
   sudo apt install vim
   ```

* Others
   ```
   sudo apt install -y zsh tmux
   sudo apt install -y curl net-tools
   sudo apt install -y build-essential cmake vim-nox python3-dev
   ```

## Install zsh plugins
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/Tarrasch/zsh-autoenv
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search
```

## Install tmux plugins
1. Display ssh host in status bar [tmux-current-pane-hostname](https://github.com/soyuka/tmux-current-pane-hostname)
    ```
    git clone https://github.com/soyuka/tmux-current-pane-hostname ~/dotConfig/libs/tmux-current-pane-hostname
    ```
2. Restore tmux session [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
    ```
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/dotConfig/libs/tmux-resurrect
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

## Install vim plugins dependecies
<details>
  <summary>Install plugin dependencies</summary>

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
</details>

<details>
  <summary>Complie YouCompleteMe </summary>
  * https://github.com/ycm-core/YouCompleteMe

  ```
  ( cd ~/.vim/plugged/YouCompleteMe/ && ./install.py --ts-completer )
  ```
</details>
