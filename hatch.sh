#!/usr/bin/env zsh

set -e
set -u
set -o pipefail

CONFIG_DIR=$0:a:h

# Load the zshrc file each time a new shell is loaded 
( [[ -a ~/.zshrc ]] && grep -qxF "source ${CONFIG_DIR}/zshrc" ~/.zshrc ) || echo "source ${CONFIG_DIR}/zshrc" >> ~/.zshrc

# Install latest version of packages
${CONFIG_DIR}/packages.sh

# Configure git
${CONFIG_DIR}/git.sh