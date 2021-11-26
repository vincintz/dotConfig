# To obtain key codes in zsh:
# bindkey -d # deletes all bindings
# Ctrl+V, followed by the key combination desired to bind prints the code to the console.

# Use emacs mode
bindkey -e

# Home/End
bindkey '^[[H'    beginning-of-line
bindkey '^[[1~'   beginning-of-line
bindkey '^[[F'    end-of-line
bindkey '^[[4~'   end-of-line

# Up/Down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ctrl-Left/Ctrl-Right
bindkey '^[[1;5D' backward-word        # Ctrl + left arrow
bindkey '^[[1;5C' forward-word         # Ctrl + right arrow

# Page-up/Page-down
bindkey '^[[5~'   up-line-or-history
bindkey '^[[6~'   down-line-or-history

# Delete char/word
bindkey '^[[3~'   delete-char
bindkey '^_'      backward-delete-word
bindkey '^[[3;5~' delete-word

# Undo/Redo
bindkey '^Z'      undo
bindkey '^Y'      redo

