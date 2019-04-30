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
mkdir /opt/tools && cd /opt/tools
curl https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
chmod +x apt-cyg
```

5. Install dependencies
* python-3
* netutils (wget)

6. Install sudo
* https://github.com/Chronial/cygwin-sudo
