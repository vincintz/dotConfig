# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set options
setopt histignorealldups sharehistory
bindkey -e

# Bind a widget with the same name as the function
zle -N paste-from-clipboard

# How to obtain key codes in zsh:
# bindkey -d # deletes all bindings
# Ctrl+V, followed by the key combination desired to bind prints the code to the console.

bindkey '\eb'     kill-region          # ESC, b
bindkey '\e\e'    kill-buffer          # ESC, ESC
bindkey '^E'      kill-whole-line      # Ctrl + E

bindkey '^[^[[A'  beep                 # ESC, Up arrow
bindkey '^[^[[B'  beep                 # ESC, Down arrow
bindkey '^[^[[C'  beep                 # ESC, Right arrow
bindkey '^[^[[D'  beep                 # ESC, Left arrow

bindkey '^Z'      undo                 # Ctrl + Z
bindkey '^Y'      redo                 # Ctrl + Y

bindkey '^R'      history-incremental-search-backward         # Ctrl + R
bindkey '^K'      history-incremental-pattern-search-backward # Ctrl + K
bindkey '^J'      history-incremental-pattern-search-forward  # Ctrl + J

bindkey '^[[5~'   up-line-or-history   # Shift + up arrow
bindkey '^[[6~'   down-line-or-history # Shift + down arrow
bindkey '^[[A'    up-line-or-history   # Up arrow
bindkey '^[[B'    down-line-or-history # Down arrow

# Make search up and down work, so partially type and hit Ctrl + up/down to find relevant stuff.
bindkey '^[[1;5A' up-line-or-search    # Ctrl + Up arrow
bindkey '^[[1;5B' down-line-or-search  # Ctrl + Down arrow

bindkey '^[[H'    beginning-of-line    # Home
bindkey '^[[1~'   beginning-of-line    # Home in ConEmu
bindkey '^[[F'    end-of-line          # End
bindkey '^[[4~'   end-of-line          # End in ConEmu
bindkey '^[[1;5D' backward-word        # Ctrl + left arrow
bindkey '^[[1;5C' forward-word         # Ctrl + right arrow
bindkey '^[[3~'   delete-char          # Del
bindkey '^_'      backward-delete-word # Ctrl + Backspace
bindkey '^[[3;5~' delete-word          # Ctrl + Del
bindkey '^[[3;2~' delete-word          # Shift + Del

# I can type multiline command lines, and still be able to move the cursor up/down between the lines while editing.
# bindkey '^J'      self-insert          # Ctrl + J, Home and End for moving to the beginning and end.

bindkey '^D'      copy-prev-shell-word # Ctrl + D
bindkey '\e.'     insert-last-word     # ESC, .
bindkey '\e_'     insert-last-word     # ESC, _
bindkey '^X'      quoted-insert        # Ctrl + X
bindkey '^V'      paste-from-clipboard # Ctrl + V

bindkey "^?"      backward-delete-char # backspace

# Use modern completion system
autoload -Uz compinit && compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# No error on wildcard no match
setopt nonomatch
setopt AUTO_CD

# Setup VCS info
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*'    enable git
zstyle ':vcs_info:git*' actionformats ' [%b:%a]'
zstyle ':vcs_info:git*' formats       ' [%b]'
zstyle ':vcs_info:hg*'  formats       ' (%b)'
precmd () { vcs_info }

is_elevated() { 
   [[ $(uname -o) -eq "Cygwin" ]] || return 1
   id -G | grep -qE '\<(114|544)\>' &> /dev/null
}

usr_prompt() {
   if [[ $(uname -o) -eq "Cygwin" ]]; then
      id -G | grep -qE '\<(114|544)\>' &> /dev/null
      if [ $? -eq 0 ]; then
         echo '%F{magenta}#%f '
      else
         echo '%# '
      fi
   else
      echo '%# '
   fi
}

git_info() {
   local gitbranch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
   if [ -n "$gitbranch" ]; then
      if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
         echo "[%F{magenta}$gitbranch%f] "
      else
         echo "[%F{cyan}$gitbranch%f] "
      fi
   fi
}

# Load plugins from libs
for plugin in $HOME/dotConfig/libs/**/*.plugin.zsh; source $plugin

PROMPT='%* %~ $(git_info)$(usr_prompt)'
