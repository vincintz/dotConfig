#!/usr/bin/env bash

BOOTSTRAP_PATH=$(dirname -- "$0")
cd "$BOOTSTRAP_PATH/.." || (echo -e "Invalid path to script\n"; exit)
DOTCONFIG_PATH=$(pwd)
FONTS_PATH=$HOME/.fonts
FONTS_LIST="Hack JetBrainsMono ComicShannsMono"

echo "=========================================
      Run system update/upgrade
      =========================================" | xargs
sudo apt update && sudo apt upgrade -y


if [ -z "$WSL_DISTRO_NAME" ]; then
  echo "=========================================
        Install GUI Apps apps
        =========================================" | xargs
  sudo apt install -y alacritty
fi

echo "=========================================
      Install essential dev apps
      =========================================" | xargs
sudo apt install -y tmux vim fzf nala
sudo apt install -y curl net-tools nmap

echo "=========================================
      Install more dev apps
      =========================================" | xargs
sudo apt install -y ripgrep fd-find bat exuberant-ctags
sudo apt install -y ncdu mc pspg
sudo apt install -y tldr && tldr update

echo "=========================================
      Install Python Tools
      =========================================" | xargs
sudo apt install -y python3-poetry
sudo apt install -y isort black

echo "=========================================
      Install Node Version Manager (nvm)
      =========================================" | xargs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "=========================================
      Install Linters
      =========================================" | xargs
sudo apt install -y shellcheck


echo "=========================================
      Install TMux Plugin Manager (tpm)
      =========================================" | xargs
if [ ! -f ~/.tmux/plugins/tpm/tpm ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "Makes sure tmux plugins are installed by pressing <c-a>I"
fi

echo "=========================================
      Set gitconfig
      =========================================" | xargs
if [ -z "$(git config --global --get user.email)" ]; then
    echo "Enter the following:"
    while true; do
        read -r -p "  * user.email: " USER_EMAIL
        read -r -p "  * user.name : " USER_NAME
        read -r -p "Is this correct '$USER_EMAIL'/'$USER_NAME' [y/N]?  " USER_CORRECT
        case $USER_CORRECT in
            [Yy]* ) break;;
        esac
    done
    git config --global user.email "$USER_EMAIL"
    git config --global user.name "$USER_NAME"
    git config --global diff.tool vimdiff
    git config --global difftool.prompt false
    git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.df "diff --compact-summary"
    git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"

fi

echo "=========================================
      Create links to config
      =========================================" | xargs
mkdir -p "$HOME/.config"
mkdir -p "$BOOTSTRAP_PATH/bak"
if git remote > /dev/null; then
    mkdir -p "$BOOTSTRAP_PATH/bak"
    mv "$HOME/.bashrc" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    mv "$HOME/.vimrc" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    mv "$HOME/.config/tmux/tmux.conf" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    ln -s "$DOTCONFIG_PATH/.bashrc" "$HOME/.bashrc"
    ln -s "$DOTCONFIG_PATH/.vimrc"  "$HOME/.vimrc"
    mkdir -p "$HOME/.config/tmux"
    ln -s "$DOTCONFIG_PATH/.config/tmux/tmux.conf" "$HOME/.config/tmux/"
    if command -v alacritty > /dev/null; then
        mv "$HOME/.config/alacritty/alacritty.toml" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
        mkdir -p "$HOME/.config/alacritty"
        ln -s "$DOTCONFIG_PATH/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
    fi
fi

echo "=========================================
      Download fonts
      =========================================" | xargs
mkdir "$FONTS_PATH"

for FONT in $FONTS_LIST; do
    cd "$BOOTSTRAP_PATH/bak" || (echo -e "Invalid path to script\n"; exit)
    curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT.tar.xz"
    cd "$FONTS_PATH" || (echo -e "Invalid path to script\n"; exit)
    tar xf "$BOOTSTRAP_PATH/bak/$FONT.tar.xz" --wildcards "*.?tf"
done
