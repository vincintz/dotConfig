# My personal dotConfig files

Mostly tested in Cygwin. TODO: make it work on Linux terminals


# Cygwin
0. Prereq
  - Powerline fonts for Windows
  - zsh
  - tmux
  - wget

1. Change Shell - zsh
  * Edit /etc/nsswitch.conf
  * db_shell: /usr/bin/zsh

2. Autorun tmux - change windows shortcut for mintty
  * mintty.exe /usr/bin/tmux

3. Map drives
* Edit /etc/fstab
```
    none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
    c: /c none bind 0 0
    d: /d none bind 0 0
    d:/home /home none bind 0 0
    d:/opt /opt none bind 0 0
    d:/tmp /tmp none bind 0 0
```

4. Clone dotConfig
```
git clone https://github.com/vincintz/dotConfig
ln -s $HOME/dotConfig/.minttyrc $HOME/.minttyrc
ln -s $HOME/dotConfig/.zshrc $HOME/.zshrc
ln -s $HOME/dotConfig/.zshenv $HOME/.zshenv
ln -s $HOME/dotConfig/.tmux.conf $HOME/.tmux.conf
```

5. Install a Package Manager - apt-cyg
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/transcode-open/apt-cyg
chmod -R g-wx,o-wx apt-cyg/*
ln -s /usr/local/lib/apt-cyg/apt-cyg /usr/local/bin/apt-cyg
```

6. Install other packages
```
apt-cyg install openssh
apt-cyg install vim
apt-cyg install zip unzip
apt-cyg install python3 python3-pip
```
```
cd /usr/local/bin/
wget https://download.elifulkerson.com//files/tcping/0.39/tcping.exe
chmod +x tcping.exe
```

7. Install sudo
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/Chronial/cygwin-sudo
chmod -R g-wx,o-wx cygwin-sudo/*
alias sudo="python3 /usr/local/lib/cygwin-sudo/cygwin-sudo.py"
```

8. Others
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/zsh-users/zsh-autosuggestions
```
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/zsh-users/zsh-syntax-highlighting
```
```
mkdir -p $HOME/dotConfig/libs 2>/dev/null ; cd $_
git clone https://github.com/Tarrasch/zsh-autoenv
```
```
mkdir -p $HOME/dotConfig/themes 2>/dev/null ; cd $_
git clone https://github.com/seebi/dircolors-solarized
```

9. Install Powerline Fonts
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/powerline/fonts powerline-fonts
chmod -R g-wx,o-wx powerline-fonts/*
```
