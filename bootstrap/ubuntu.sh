#!/usr/bin/env bash

BOOTSTRAP_PATH=$(dirname -- "$0")
cd "$BOOTSTRAP_PATH/.." || (echo -e "Invalid path to script\n"; exit)
DOTCONFIG_PATH=$(pwd)

echo "=========================================
Run system update/upgrade
=========================================" | xargs
sudo apt update && sudo apt upgrade -y

echo "=========================================
Install essential dev apps
=========================================" | xargs
sudo apt install -y build-essential
sudo apt install -y git
sudo apt install -y zsh tmux vim
sudo apt install -y curl net-tools nmap

echo "=========================================
Install more dev apps
=========================================" | xargs
sudo apt install -y zoxide fzf
sudo apt install -y ripgrep fd-find bat exuberant-ctags
sudo apt install -y ncdu mc pspg
sudo apt install -y luarocks

echo "=========================================
Install Homebrew
=========================================" | xargs
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install starship
brew install tldr

# echo "=========================================
#       Install starship (prompt)
#       =========================================" | xargs
# if ! command -v starship > /dev/null; then
#     curl -sS https://starship.rs/install.sh | sh
# fi

# echo "=========================================
#       Install Python Tools
#       =========================================" | xargs
# sudo apt install -y python3-poetry
# sudo apt install -y python3-venv
# sudo apt install -y isort black

# echo "=========================================
#       Install Node Version Manager (nvm)
#       =========================================" | xargs
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# echo "=========================================
#       Install Linters
#       =========================================" | xargs
# sudo apt install -y shellcheck

echo "=========================================
Install TMux Plugin Manager (tpm)
=========================================" | xargs
if [ ! -f ~/.tmux/plugins/tpm/tpm ]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "Makes sure tmux plugins are installed by pressing <c-a>I"
fi

# echo "=========================================
#       Set gitconfig
#       =========================================" | xargs
# if [ -z "$(git config --global --get user.email)" ]; then
#     echo "Enter the following:"
#     while true; do
#         read -r -p "  * user.email: " USER_EMAIL
#         read -r -p "  * user.name : " USER_NAME
#         read -r -p "Is this correct '$USER_EMAIL'/'$USER_NAME' [y/N]?  " USER_CORRECT
#         case $USER_CORRECT in
#             [Yy]* ) break;;
#         esac
#     done
#     git config --global user.email "$USER_EMAIL"
#     git config --global user.name "$USER_NAME"
#     git config --global diff.tool vimdiff
#     git config --global difftool.prompt false
#     git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#     git config --global alias.df "diff --compact-summary"
#     git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
#     git config --global alias.merges "log --oneline --decorate --color=auto --merges --first-parent"

# fi

echo "=========================================
Add zsh plugins
=========================================" | xargs
mkdir -p /home/theo/dotConfig/zsh/libs/ && cd $_
git clone https://github.com/Tarrasch/zsh-autoenv
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search

echo "=========================================
Create links to config
=========================================" | xargs
mkdir -p "$BOOTSTRAP_PATH/bak"
if git remote > /dev/null; then
  mkdir -p "$BOOTSTRAP_PATH/bak"
  mv "$HOME/.zshrc" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.zshenv" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.bashrc" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.bash_profile" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.tmux.conf" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.vimrc" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  mv "$HOME/.editorconfig" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
  ln -s "$DOTCONFIG_PATH/zsh/.zshrc" "$HOME"
  ln -s "$DOTCONFIG_PATH/zsh/.zshenv" "$HOME"
  ln -s "$DOTCONFIG_PATH/bash/.bashrc" "$HOME"
  cp "$DOTCONFIG_PATH/bash/.bash_profile" "$HOME"
  ln -s "$DOTCONFIG_PATH/tmux/.tmux.conf" "$HOME"
  ln -s "$DOTCONFIG_PATH/vim/.vimrc" "$HOME"
  ln -s "$DOTCONFIG_PATH/vim/.editorconfig" "$HOME"
  if command -v alacritty > /dev/null; then
    mv "$HOME/.config/alacritty/alacritty.toml" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    mkdir -p "$HOME/.config/alacritty"
    ln -s "$DOTCONFIG_PATH/alacritty/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
  fi
  if command -v mc > /dev/null; then
    mv "$HOME/.config/mc/ini" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    mkdir -p "$HOME/.config/mc"
    ln -s "$DOTCONFIG_PATH/mc/.config/mcy/ini" "$HOME/.config/mc/"
  fi
  if command -v nvim > /dev/null; then
    mv "$HOME/.config/nvim/" "$BOOTSTRAP_PATH/bak/" 2>/dev/null
    ln -s "$DOTCONFIG_PATH/nvim/.config/nvim" "$HOME/.config"
  fi
fi
