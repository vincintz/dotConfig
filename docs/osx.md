# OSX

## Install Homebrew

* https://brew.sh/
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  ```

## Install packages

* `brew cask list`
  ```
  android-ndk              android-studio           docker                   google-chrome            java                     mysqlworkbench           vagrant
  android-sdk              atom                     firefox                  insomnia                 mono-mdk                 spotify
  ```
* `brew list`
  ```
  cask                    ghostscript             jpeg                    libpng                  ncurses                 p11-kit                 sqlite
  coreutils               glib                    libde265                libtasn1                neofetch                pcre                    tmux
  docbook                 gmp                     libevent                libtiff                 nettle                  pkcs11-helper           unbound
  docbook-xsl             gnu-getopt              libffi                  libtool                 openexr                 protobuf                utf8proc
  emacs                   gnutls                  libheif                 libunistring            openjdk                 python@3.8              webp
  freetype                httpie                  libidn2                 little-cms2             openjpeg                readline                x265
  gdbm                    ilmbase                 liblqr                  lz4                     openssl@1.1             screenresolution        xmlto
  gettext                 imagemagick             libomp                  lzo                     openvpn                 shared-mime-info        xz
```

## Install Node Version Manager

* install
```
brew install nvm
mkdir ~/.nvm
```

* .zshrc
  ```
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  ```
