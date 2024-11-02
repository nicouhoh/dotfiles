# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

export PATH=$PATH:~/.local/bin

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
# source ~/.config/kitty/LS_COLORS/lscolors.sh

alias ls="ls --color"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias src="source ~/.zshrc"

if [ $(uname -m) = "arm64" ]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
else
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
