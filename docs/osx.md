# OSX

## Install Homebrew

* https://brew.sh/
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/theo/.zprofile
  ```

  ```
  brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
  brew install tmux
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font 
  brew install --cask alacritty waterfox
  ```
  
  ```
  brew reinstall python
  brew install vim -vd protobuf
  brew install vim -vd protobuf
  /Users/theo/.vim/plugged/YouCompleteMe/third_party/ycmd/build.py --ts-completer --verbose
  ```

## Install Node Version Manager

* Install Node Version Manager
  ```
  mkdir ~/.nvm
  brew install nvm
  ```

## Install other packages

* `brew list`
  ```
  ant                     ghostscript             lame                    libtool                 nginx                   pkcs11-helper           tree
  bdw-gc                  glib                    libde265                libunistring            node                    pkg-config              unbound
  cask                    gmp                     libevent                libvorbis               nvm                     protobuf                utf8proc
  coreutils               gnu-getopt              libffi                  little-cms2             openexr                 python@3.8              watch
  diff-so-fancy           gnutls                  libheif                 lz4                     openjdk                 python@3.9              webp
  docbook                 guile                   libidn2                 lzo                     openjpeg                readline                wget
  docbook-xsl             htop                    liblqr                  mad                     openssl@1.1             ripgrep                 x265
  dos2unix                httpie                  libogg                  mpg123                  openvpn                 screenresolution        xmlto
  emacs                   icu4c                   libomp                  mysql                   opus                    shared-mime-info        xz
  flac                    ilmbase                 libpng                  mysql-client            opusfile                sox                     yarn
  freetype                imagemagick             libsndfile              ncurses                 p11-kit                 sqlite
  gdbm                    jansson                 libtasn1                neofetch                pcre                    tcping
  gettext                 jpeg                    libtiff                 nettle                  pcre2                   tmux
  adobe-acrobat-reader          atom                          docker                        google-chat                   java                          skype
  alacritty                     balenaetcher                  drawio                        google-chrome                 microsoft-auto-update         spotify
  android-ndk                   bitwarden                     firefox                       imageoptim                    microsoft-edge                vagrant
  android-sdk                   blisk                         gifcapture                    insomnia                      mono-mdk                      visual-studio-code
  android-studio                dbeaver-community             gimp                          intellij-idea-ce              mysqlworkbench
  ```

* `brew list --cask`
  ```
  adobe-acrobat-reader          atom                          docker                        google-chat                   java                          skype
  alacritty                     balenaetcher                  drawio                        google-chrome                 microsoft-auto-update         spotify
  android-ndk                   bitwarden                     firefox                       imageoptim                    microsoft-edge                vagrant
  android-sdk                   blisk                         gifcapture                    insomnia                      mono-mdk                      visual-studio-code
  android-studio                dbeaver-community             gimp                          intellij-idea-ce              mysqlworkbench
  ```
