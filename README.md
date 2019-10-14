# My personal dotConfig files

Mostly tested in Cygwin and ssh shell


# Windows

##  Prerequisites
- Cygwin packages - zsh, tmux, wget, gnupg2
- Windows Git
- (optional) Hack - powerline font for Windows

## Post install
* Change Shell - zsh
    * Edit /etc/nsswitch.conf
    * db_shell: /usr/bin/zsh
* Autorun tmux - change windows shortcut for mintty
    * mintty.exe /usr/bin/tmux
* Map drives
    * Edit /etc/fstab
```
    none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
    c: /c none bind 0 0
    d: /d none bind 0 0
    c:/Users /home none bind 0 0
    d:/opt /opt none bind 0 0
    d:/tmp /tmp none bind 0 0
```

## Install other cygwin packages
* TODO: change apt-cyg to https://github.com/kou1okada/apt-cyg
```
# mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
# git clone https://github.com/kou1okada/apt-cyg
# chmod -R g-wx,o-wx apt-cyg/*
# ln -s /usr/local/lib/apt-cyg/apt-cyg /usr/local/bin/apt-cyg

# PROBLEM: Can't run apt-cyg withou gnupg2
# apt-cyg install gnupg2
```

* Install a Package Manager - apt-cyg
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/transcode-open/apt-cyg
chmod -R g-wx,o-wx apt-cyg/*
ln -s /usr/local/lib/apt-cyg/apt-cyg /usr/local/bin/apt-cyg
```
* Use apt-cyg
```
apt-cyg install openssh
apt-cyg install vim dos2unix
apt-cyg install zip unzip
apt-cyg install python3 python3-pip
apt-cyg install inetutils procps-ng openssh
```
* Manual - wget
```
cd /usr/local/bin/
wget https://download.elifulkerson.com//files/tcping/0.39/tcping.exe
chmod +x tcping.exe

wget https://github.com/rprichard/winpty/releases/download/0.4.3/winpty-0.4.3-cygwin-2.8.0-x64.tar.gz
tar xvf winpty-0.4.3-cygwin-2.8.0-x64.tar.gz
mv winpty-0.4.3-cygwin-2.8.0-x64 /usr/local/lib
ln -s /usr/local/lib/winpty-0.4.3-cygwin-2.8.0-x64/bin/winpty.exe /usr/local/bin/winpty
```
* Install sudo
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/Chronial/cygwin-sudo
chmod -R g-wx,o-wx cygwin-sudo/*
alias sudo="python3 /usr/local/lib/cygwin-sudo/cygwin-sudo.py"
```

## Install chocolatey (Windows)
* see: https://chocolatey.org/install
```
winpty sudo powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

sudo choco install notepadplusplus
sudo choco install bitwarden
sudo choco install git
sudo choco install treesizefree
sudo choco install adoptopenjdk8
sudo choco install adoptopenjdk11
sudo choco install dbeaver
sudo choco install winscp
sudo choco install paint.net
sudo choco install drawio
sudo choco install pencil
sudo choco install jmeter
sudo choco install postman
sudo choco install soapui
sudo choco install virtualbox
sudo choco install docker-machine
sudo choco install vagrant
```

## Setup docker-machine
```
docker-machine create default
eval "$(docker-machine env default)"
```

# Linux/Windows

## Clone dotConfig
```
git clone https://github.com/vincintz/dotConfig
ln -s $HOME/dotConfig/.minttyrc $HOME/.minttyrc
ln -s $HOME/dotConfig/.zshrc $HOME/.zshrc
ln -s $HOME/dotConfig/.zshenv $HOME/.zshenv
ln -s $HOME/dotConfig/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotConfig/.vimrc $HOME/.vimrc
```

## Install zsh plugins
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/Tarrasch/zsh-autoenv
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search
```

## TODO - find better way to set dircolors
```
mkdir -p $HOME/dotConfig/themes 2>/dev/null ; cd $_
git clone https://github.com/seebi/dircolors-solarized
```
