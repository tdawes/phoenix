#!/usr/bin/env zsh

set -e
set -u
set -o pipefail

CONFIG_DIR=$0:a:h

# Load the zshrc file each time a new shell is loaded 
( [[ -a ~/.zshrc ]] && grep -qxF 'source config/setup/zshrc' ~/.zshrc ) || echo 'source config/setup/zshrc' >> ~/.zshrc

# Install latest version of packages
${CONFIG_DIR}/packages.sh
