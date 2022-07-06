#!/bin/shs

# catch error
# set -e

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 3600; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing Homebrew: Complete"
# Install Apps using Homebrew Cask
echo "Installing mysides using Homebrew Cask..."
brew install --cask mysides

echo "Setting up System Preference..."

# Dock---------------------------------------------------------------------------------------------------------
# Dockのサイズを30にする
defaults write com.apple.dock tilesize -int 30
# Dock拡大
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80
# ウィンドウのタイトルバーのダブルクリックで拡大/縮小にする
defaults delete -g AppleActionOnDoubleClick
# 起動中のアプリケーションをアニメションで表示（チェックボックスオン）
defaults delete com.apple.dock launchanim
# 最近使ったアプリケーションをDockに表示
defaults write com.apple.dock show-recents -bool false

# Finder--------------------------------------------------------------------------------------------------------
# Finder sidebar
mysides add ${HOME} file://${HOME}/
mysides remove Applications
mysides remove Desktop
mysides remove Documents
mysides remove Downloads
# Delete tags in sidebar
defaults write com.apple.finder ShowRecentTags -bool false
# 新しいウィンドウはデフォルトでホームディレクトリを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Finderタイトルをフルパスに変更
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
# ステータスバーの表示
defaults write com.apple.finder ShowStatusBar -bool true
# タブバーを表示
defaults write com.apple.finder ShowTabView -bool true
# パスバーの表示
defaults write com.apple.finder ShowPathbar -bool true
# Finderの表示をカラムビューにする。「Nlsv」(リストビュー)「icnv」(アイコンビュー)、「clmv」(カラムビュー)、「Flwv」(カバーフロービュー)から選択
defaults write com.apple.Finder FXPreferredViewStyle clmv
# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Keyboard--------------------------------------------------------------------------------------------------------
# キーのリピートを環境設定よりも早くする
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
killall SystemUIServer

# Enable `Tap to click` （タップでクリックを有効にする）------------------------------------------------------------------------
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# その他--------------------------------------------------------------------------------------------------------
# 時計アイコンクリック時に OS やホスト名 IP を表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# System Appearance
defaults write NSGlobalDomain "AppleInterfaceStyle" -string "Dark"
# バッテリー残量のパーセンテージ表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 設定の反映---------------------------------------------------------------------------------------------------------
killall Dock
killall Finder
killall SystemUIServer
killall Dock

# Install Homebrew Package-------------------------------------------------------------------------------------------
echo "Installing Homebrew Package..."
brew install cask
brew install brew-cask-completion
brew install nodenv
brew install mas
brew install mysql
brew install git
brew install pyenv
brew install pipenv
brew install postgresql
brew install youtube-dl
echo "Installing Homebrew Package: Complete"

echo "Tapping for Fonts..."
brew tap homebrew/cask-fonts
echo "Tapping for Fonts: Complete"

# Install Apps using Homebrew Cask--------------------------------------------------------------------------------
echo "Installing Apps using Homebrew Cask..."
brew install --cask adobe-acrobat-reader
brew install --cask appcleaner
brew install --cask cyberduck
brew install --cask discord
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask google-japanese-ime
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask macs-fan-control
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask microsoft-word
brew install --cask nordvpn
brew install --cask notion
brew install --cask noxappplayer
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zoom

echo "Installing Apps using Homebrew Cask: Complete"

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
alias github="sh ~/mac_setup/github.sh"

# Enable zsh completion
autoload -U compinit
compinit

#---------------------------------------
export PGDATA=/usr/local/var/postgres

setopt +o nomatch

# vscodeとgithubの連携(zsh起動時にssh-addをkeychainから読み込むようにする)
ssh-add -K

' >> ~/.zshrc
echo "Setting up .zshrc: Complete"

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

# Setup pyhton-------------------------------------------------------------------------------------------------
echo "Install python..."
pyenv install 3.8.2
pyenv install 3.9.6
pyenv global 3.8.2
nodenv install 14.17.3
nodenv global 14.17.3

# Install Apps from AppStore using mas-----------------------------------------------------------------------
echo "Installing Apps from AppStore using mas command..."
echo "Please login with your Apple ID."
open -a "App Store"
read -p "Press [Enter] key to resume setup..."
mas install 539883307  # LINE
mas install 1444383602 # GoodNotes
echo "Installing Apps from AppStore using mas command: Complete"

# Launchpad--------------------------------------------------------------------------------------------------------
# 表示件数を8x10にする
defaults write com.apple.dock springboard-rows -int 8
defaults write com.apple.dock springboard-columns -int 10
# Reset LaunchPad (but not regular)
defaults write com.apple.dock ResetLaunchPad -bool true

# End & Reboot---------------------------------------------------------------------------------------------------
echo "<<< macOS Environment Configurator for tyl >>>"
echo "END....."
echo "Rebooting machine..."
sudo shutdown -r now
