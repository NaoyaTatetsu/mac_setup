#!/bin/shs

# Ask for the administrator password upfront
sudo -v

# Setup pyhton-------------------------------------------------------------------------------------------------
echo "Install python..."

pyenv install 3.8.2
pyenv install 3.9.6
pyenv global 3.8.2
nodenv install 14.17.3
nodenv global 14.17.3

echo "Setup python and node completed..."