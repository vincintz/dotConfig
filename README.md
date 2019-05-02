# My personal dotConfig files

Mostly tested in Cygwin. TODO: make it work on Linux terminals


# Cygwin
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

4. Install a Package Manager - apt-cyg
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/transcode-open/apt-cyg
chmod -R g-wx,o-wx apt-cyg/*
ln -s /usr/local/lib/apt-cyg/apt-cyg /usr/local/bin/apt-cyg
```

5. Install dependencies
```
apt-cyg install python3
```

6. Install sudo
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/Chronial/cygwin-sudo
chmod -R g-wx,o-wx cygwin-sudo/*
alias sudo="python3 /usr/local/lib/cygwin-sudo/cygwin-sudo.py"
```

7. Others
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
clone https://github.com/Tarrasch/zsh-autoenv
```

8. Install Powerline Fonts
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/powerline/fonts powerline-fonts
chmod -R g-wx,o-wx powerline-fonts/*
```
