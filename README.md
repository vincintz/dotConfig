# My personal dotConfig files

Mostly tested in Cygwin with zsh shell


# Windows

## Install chocolatey - The Package Manager for Windows

* Instructions in https://chocolatey.org/install

* Run powershell as admin
```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

* Install the following Windows application
```
choco install -y git.install
choco install -y notepadplusplus.install
choco install -y hackfont
choco install -y inconsolata
choco install -y virtualbox
choco install -y openjdk
choco install -y adoptopenjdk8
choco install -y 7zip.install
choco install -y nvm
choco install -y bitwarden
choco install -y treesizefree
choco install -y wps-office-free
choco install -y youtube-dl
choco install -y vlc
choco install -y dbeaver
choco install -y winscp
choco install -y paint.net
choco install -y drawio
choco install -y pencil
choco install -y jmeter
choco install -y postman
choco install -y soapui
choco install -y docker-machine
choco install -y vagrant
choco install -y vscode
choco install -y intellijidea-community
```

##  Install Cygwin

* Download from https://cygwin.com/install.html
* Set
  * Root Directory: `C:\cygwin\root`
  * Local Packages: `C:\cygwin\package` 
* Install the following packages
```
zsh, tmux, wget, gnupg2, python3
```

* Create directories
```
mkdir c:\tmp
mkdir c:\opt
```

* Map drives - edit /etc/fstab
```
none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
c: /c none bind 0 0
d: /d none bind 0 0
c:/Users /home none bind 0 0
c:/opt /opt none bind 0 0
c:/tmp /tmp none bind 0 0
```

* Change default shell - edit /etc/nsswitch.conf
```
db_shell: /usr/bin/zsh
```

## Install cygwin packages

### Manual download

* Install sudo
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/Chronial/cygwin-sudo
chmod -R g-wx,o-wx cygwin-sudo/*
alias sudo="python3 /usr/local/lib/cygwin-sudo/cygwin-sudo.py"
```

* Install apt-cyg
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
git clone https://github.com/kou1okada/apt-cyg
chmod -R g-wx,o-wx apt-cyg/*
ln -s /usr/local/lib/apt-cyg/apt-cyg /usr/local/bin/apt-cyg
```

* Install winpty
```
mkdir -p /usr/local/lib/ 2>/dev/null ; cd $_
wget https://github.com/rprichard/winpty/releases/download/0.4.3/winpty-0.4.3-cygwin-2.8.0-x64.tar.gz
tar xvf winpty-0.4.3-cygwin-2.8.0-x64.tar.gz
ln -s /usr/local/lib/winpty-0.4.3-cygwin-2.8.0-x64/bin/winpty.exe /usr/local/bin/winpty
rm winpty-0.4.3-cygwin-2.8.0-x64.tar.gz
```

* Install tcping
```
cd /usr/local/bin/
wget https://download.elifulkerson.com//files/tcping/0.39/tcping.exe
chmod +x tcping.exe
```

### Using apt-cyg
```
apt-cyg install openssh
apt-cyg install vim dos2unix
apt-cyg install zip unzip
apt-cyg install python3-pip
apt-cyg install inetutils procps-ng openssh
```

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

## Others

* Setup docker-machine
```
docker-machine create default
eval "$(docker-machine env default)"
```

* Create shortcut
```
C:\cygwin\root\bin\mintty.exe /usr/bin/tmux
```