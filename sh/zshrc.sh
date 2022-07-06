#!/bin/shs

# Ask for the administrator password upfront
sudo -v

# Setup .zshrc-------------------------------------------------------------------------------------------------
echo "Setting up .zshrc..."
echo '# PATH
export PATH="/usr/local/sbin:$PATH"

# Mysql
# export PATH=$PATH:/usr/local/bin/mysqldump
# export PATH=$PATH:/usr/local/bin/Mysql

# ts
export PATH=$PATH:`npm bin -g`

# Alias
alias vc="open -a /Applications/Visual\ Studio\ Code.app"
alias brew-maintenance="brew update; brew upgrade; brew cleanup; brew doctor;"
alias github="sh ~/develop/mac_setup/sh/github.sh"

# Enable zsh completion
autoload -U compinit
compinit

#---------------------------------------
export PGDATA=/usr/local/var/postgres

setopt +o nomatch

# vscodeとgithubの連携(zsh起動時にssh-addをkeychainから読み込むようにする)
# ssh-add -K

' >> ~/.zshrc

echo "Setting up .zshrc: Complete"