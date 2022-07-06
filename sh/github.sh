#!/usr/local/bin/zsh
CONFIG=".git/config"
if [ -e  $CONFIG ]; then
  FILE=$(<$CONFIG)
  GITHUB_HTTPS="https://github.com/*"
  GITHUB_GITAT="git@github.com:*"
  for line in $FILE
  do
    if [[ $line = $GITHUB_HTTPS ]]; then
      open $line
    elif [[ $line = $GITHUB_GITAT ]]; then
      open ${line/git@github.com:/https://github.com/}
    fi
  done
else
  open "https://github.com/"
fi