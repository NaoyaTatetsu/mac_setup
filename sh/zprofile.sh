#!/bin/shs

# Ask for the administrator password upfront
sudo -v

# Setup .zprofile------------------------------------------------------------------------------------------------
echo "Setting up .zprofile..."

echo '# pyenv settings
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init --path)"
fi

#nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
' >> ~/.zprofile

echo "Setting up .zprofile: Complete"