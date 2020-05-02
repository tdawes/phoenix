#!/usr/bin/env zsh

set -e
set -u
set -o pipefail

# Install Brew if it's not installed
if [[ ! $(command -v brew) ]]
then 
  # Install Brew
  # See https://brew.sh/ for more information
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


# Update the brew repository
echo Updating brew...
brew update

# Update the right version of zsh
brew install zsh

# Install packages
pkgs=(
  awscli
  direnv
  fswatch
  git
  git-crypt
  gnupg
  gnupg2
  go
  httpie
  jq
  make
  node
  perl
  python
  python3
  ruby
  terraform
  tree
  watch
  wget
  yarn
)

apps=(
  adobe-creative-cloud
  blender
  docker
  dropbox
  expressvpn
  firefox
  google-chrome
  handbrake
  iterm2
  kindle
  lastpass
  meshmixer
  microsoft-office
  moom
  slack
  spotify
  steam
  the-unarchiver
  visual-studio-code
  vlc
  whatsapp
  zoom
)

fonts=(
  fira-code
  pt-mono
  source-code-pro
)

echo Installing packages...
pkg_counter=0
for pkg in "${pkgs[@]}"
do
  if brew ls --versions $pkg &> /dev/null
  then
    echo Package $pkg is already installed.
  else 
    echo Installing $pkg...
    brew install $pkg
    pkg_counter=( $pkg_counter + 1 )
    echo Package $pkg installed.
  fi
done
echo $pkg_counter packages installed.

echo Installing applications...
app_counter=0
for app in "${apps[@]}"
do
  if brew cask ls --versions $app &> /dev/null
  then
    echo Application $app is already installed.
  else
    echo Installing $app...
    brew cask install $app
    app_counter=( $app_counter + 1 )
    echo Application $app installed.
  fi
done
echo $app_counter applications installed.

echo Installing fonts...
brew tap homebrew/cask-fonts
font_counter=0
for font in "${fonts[@]}"
do
  if brew cask ls --versions "font-${font}" &> /dev/null
  then
    echo Font $font is already installed.
  else 
    echo Installing font $font...
    brew cask install "font-${font}"
    font_counter=( $font_counter + 1 )
    echo Font $font installed.

  fi
done
echo $font_counter fonts installed.

