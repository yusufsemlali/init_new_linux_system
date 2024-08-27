#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
NVIM='https://github.com/neovim/neovim-releases/releases/download/v0.10.1/nvim-linux64.tar.gz'

# Function to print messages in green
function success() {
    echo -e "${GREEN}$1${NC}"
}

# Function to print messages in red
function error() {
    echo -e "${RED}$1${NC}"
}

# Update and upgrade system packages
function update_system() {
    echo "Updating and upgrading system packages..."
    sudo apt update && sudo apt upgrade -y
}

# Install essential programs
function install_programs() {
    echo "Installing essential programs..."
    sudo apt install -y vim git curl wget build-essential vim
    sudo apt install  -y gcc g++ make cmake clang neofetch


}

# Configure Neovim
function configure_neovim() {
    echo "Installing Neovim..."
    wget $NVIM
    tar xzf nvim-linux64.tar.gz
    sudo mv nvim-linux64/bin/nvim /usr/bin/
    rm nvim-linux64.tar.gz
    rm -rf nvim-linux64 
    mkdir -p ~/.config
    cp -r nvim ~/.config/
    cp init.vim ~/.config/nvim/
    nvim --version
    echo "Neovim installed successfully!"
}


# Install Homebrew
function install_brew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew update
    brew isntall oh-my-posh
}

# Configure environment variables
function configure_env() {
    echo "Configuring environment variables..."
    # Add environment variables configuration here
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo 'export EDITOR=vim' >> ~/.bashrc
    source ~/.bashrc
}

# Set up shell configuration
function configure_shell() {
    echo "Setting up shell configuration..."
    # Example for Bash; modify or add for Zsh or other shells as needed
    cp .bashrc ~/.bashrc
    source ~/.bashrc
}


# Main script execution
function main() {
    update_system
    install_programs
    isntall_brew
    configure_env
    configure_shell
    configure_neovim
    success "Setup complete!"
}

# Execute the main function
main

