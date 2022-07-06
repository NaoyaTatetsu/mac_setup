#!/bin/shs

# Ask for the administrator password upfront
sudo -v

echo "Start app.sh..."

# Install Homebrew Package-------------------------------------------------------------------------------------------
echo "Installing Homebrew Package..."
brew install cask
brew install brew-cask-completion
brew install nodenv
brew install mas # mas-cli
brew install --cask mysides
brew install mysql
# brew install git
brew install pyenv
brew install pipenv
brew install postgresql
brew install youtube-dl
echo "Installing Homebrew Package: Complete"

# Install Apps using Homebrew Cask--------------------------------------------------------------------------------
echo "Installing Apps using Homebrew Cask..."
brew install --cask adobe-acrobat-reader
brew install --cask appcleaner
brew install --cask cyberduck
brew install --cask discord
# brew install --cask google-chrome
brew install --cask google-drive
# brew install --cask google-japanese-ime
brew install --cask iterm2
# brew install --cask karabiner-elements
brew install --cask macs-fan-control
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask nordvpn
brew install --cask notion
# brew install --cask noxappplayer
brew install --cask slack
# brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zoom
echo "Installing Apps using Homebrew Cask: Complete"

# Install Apps from AppStore using mas-----------------------------------------------------------------------
echo "Installing Apps from AppStore using mas command..."
echo "Please login with your Apple ID."
open -a "App Store"
read -p "Press [Enter] key to resume setup..."
mas install 539883307  # LINE
mas install 1444383602 # GoodNotes
echo "Installing Apps from AppStore using mas command: Complete"

echo "Done app.sh..."