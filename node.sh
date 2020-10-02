#!/usr/bin/env zsh

set -e
set -u
set -o pipefail

# Install NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

