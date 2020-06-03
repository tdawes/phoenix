#!/usr/bin/env zsh 

git config --global user.name "Tom Dawes"
git config --global user.email "tomdawes91@gmail.com"

git config --global alias.pull-request "! ${${(%):-%x}:a:h}/git/create-pull-request"
git config --global alias.pr pull-request
git config --global alias.uplink "! ${${(%):-%x}:a:h}/git/uplink"
git config --global alias.lola "log --oneline --all --decorate --graph"
