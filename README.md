# TODO Cygwin
## Change Shell - zsh
* Edit /etc/nsswitch.conf
* db_shell: /usr/bin/zsh

## Change Shortcut
* mintty.exe /usr/bin/tmux

# Set drives
* Edit /etc/fstab
```
    none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
    d: /d none bind 0 0
    c: /c none bind 0 0
    d:/home /home none bind 0 0
    d:/opt /opt none bind 0 0
    d:/tmp /tmp none bind 0 0
```
