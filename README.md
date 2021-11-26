# My personal dotConfig files

Mostly tested in Cygwin with zsh shell

TODO: Link to OS specific Instructions
* Windows
* OSX

## Configure shell

* Clone dotConfig
```
git clone https://github.com/vincintz/dotConfig
ln -s $HOME/dotConfig/.minttyrc $HOME/.minttyrc
ln -s $HOME/dotConfig/.zshrc $HOME/.zshrc
ln -s $HOME/dotConfig/.zshenv $HOME/.zshenv
ln -s $HOME/dotConfig/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotConfig/.vimrc $HOME/.vimrc
```

* Install zsh plugins
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/Tarrasch/zsh-autoenv
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search
```

* Install plug-ins (Linux)

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

## Notes
* Update
```
sudo apt update
apt list --upgradable | tee apt-upgrade_$(date '+%Y%m%d').txt
sudo apt upgrande -y
```

* Install powerline font
```
sudo apt-get install fonts-powerline
```

* Install alacritty
```
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y  alacritty
```

* Install vim 8.2
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim
```

* Install stuff
```
sudo apt install -y zsh tmux
sudo apt install curl net-tools
```

* Install [vim plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

