#!/bin/bash
# Install core development tools using Homebrew (no sudo required)
brew install git
brew install node
brew install python
brew install openssl

# Install Visual Studio Code via Homebrew Cask
brew install --cask visual-studio-code

# Set up Node Version Manager (nvm) after installing Node.js
brew install nvm
mkdir -p "$HOME/.nvm"
echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.bash_profile"
echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"' >> "$HOME/.bash_profile"

# After VS Code is installed, install recommended extensions
code --install-extension ms-python.python
code --install-extension github.copilot
code --install-extension ms-azuretools.vscode-docker
code --install-extension ritwickdey.LiveServer
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension vscode-icons-team.vscode-icons
code --install-extension WakaTime.vscode-wakatime
code --install-extension TabNine.tabnine-vscode
code --install-extension NomicFoundation.hardhat-solidity
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-containers
