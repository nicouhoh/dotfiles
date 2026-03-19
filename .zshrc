# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nico/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
PS1='%n@%m %1~ %# '


export PATH=$PATH:~/.local/bin
export PATH="$HOME/.emacs.d/bin/:$PATH"

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
# source ~/.config/kitty/LS_COLORS/lscolors.sh

alias ls="ls --color"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias src="source ~/.zshrc"

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select


# This is part of NVM install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# source script for git prompt
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
