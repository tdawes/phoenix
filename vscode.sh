#!/usr/bin/env zsh

code --install-extension esbenp.prettier-vscode
code --install-extension ricard.postcss

VSCODE_SETTINGS_FILE=~/Library/Application\ Support/Code/User/settings.json
if [[ ! -a $VSCODE_SETTINGS_FILE ]]
then 
  echo "{}" > $VSCODE_SETTINGS_FILE
fi

cat <<< $(jq -s '.[0] * .[1]' ${${(%):-%x}:a:h}/vscode/settings.json $VSCODE_SETTINGS_FILE) > $VSCODE_SETTINGS_FILE