export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git kubectl ssh-agent z docker docker-compose zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete terraform)

zstyle :omz:plugins:ssh-agent identities id_rsa github_wsl

source $ZSH/oh-my-zsh.sh

# User configuration

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/izio/go/bin
export KUBECONFIG=/home/izio/kube/k3s.yml
