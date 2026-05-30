#!/usr/bin/env bash
# Cross-platform vim.pack plugin manager
# Usage: ./pack-update.sh [install|update|clean]

set -e

PACK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.config/nvim/pack/theovim"
START_DIR="$PACK_DIR/start"
OPT_DIR="$PACK_DIR/opt"

usage() {
  cat <<HELP
vim.pack Plugin Manager
Usage: $0 [install|update|clean]

Commands:
  install   - Initialize all plugins (clone submodules)
  update    - Update all plugins to latest versions
  clean     - Remove all plugins (not the config)
  list      - List installed plugins
HELP
}

install_plugins() {
  echo "Installing vim.pack plugins..."
  cd "$(dirname "$PACK_DIR")"
  
  if ! command -v git &> /dev/null; then
    echo "Error: git is required"
    exit 1
  fi
  
  git submodule update --init --recursive
  echo "✓ Plugins installed"
}

update_plugins() {
  echo "Updating vim.pack plugins..."
  
  if ! command -v git &> /dev/null; then
    echo "Error: git is required"
    exit 1
  fi
  
  cd "$(dirname "$PACK_DIR")"
  git submodule update --remote
  echo "✓ Plugins updated"
}

clean_plugins() {
  echo "WARNING: This will remove all plugin directories"
  read -p "Continue? (y/N) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$START_DIR"/*
    rm -rf "$OPT_DIR"/*
    echo "✓ Plugins removed"
  else
    echo "Cancelled"
  fi
}

list_plugins() {
  echo "START plugins (loaded on startup):"
  ls -1 "$START_DIR" 2>/dev/null | sed 's/^/  - /'
  echo ""
  echo "OPT plugins (lazy-loaded):"
  ls -1 "$OPT_DIR" 2>/dev/null | sed 's/^/  - /'
}

case "${1:-install}" in
  install)
    install_plugins
    ;;
  update)
    update_plugins
    ;;
  clean)
    clean_plugins
    ;;
  list)
    list_plugins
    ;;
  *)
    usage
    exit 1
    ;;
esac
