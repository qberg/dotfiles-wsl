#!/bin/bash

BLUE_BOLD='\[\e[01;34m\]'
RED_BOLD='\[\e[01;31m\]'
WHITE_BOLD='\[\e[01;0m\]'
PS1="${RED_BOLD}\t ${BLUE_BOLD}[${RED_BOLD}\W${BLUE_BOLD}]-> ${WHITE_BOLD}"

# Ignore case during tab completion.
bind 'set completion-ignore-case on'

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# pyenv environment variables
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pyenv initialization
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
alias dotfiles='/usr/bin/git --git-dir=/home/qberg_noe/.dotfiles/ --work-tree=/home/qberg_noe'
