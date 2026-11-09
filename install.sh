#!/bin/bash

LOG_FILE="main.log"

source ./applications/headless/packages.sh
source ./applications/desktop/packages.sh
source ./applications/headless/brew.sh
source ./utils.sh

main() {
    check_configure_git

    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi

    install_packages
    install_tpm

    sudo chsh -s $(which zsh) $USER

    copy_dotfiles
    copy_wallpapers

    DOTFILES_DIR=$HOME/.dotfiles
    (
        cd $DOTFILES_DIR

        # Default Stow hierarchy doesn't work for /etc dirs, skipping keyd.
        stow *
    )

    echo "Configuration complete, logout recommended."
}

main 2>&1 | tee "$LOG_FILE"
