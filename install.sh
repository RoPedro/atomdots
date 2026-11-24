#!/bin/bash

LOG_FILE="main.log"
BREW_PATH=/home/linuxbrew/.linuxbrew

source ./applications/headless/packages.sh
source ./applications/desktop/packages.sh
source ./applications/headless/brew.sh
source ./utils.sh

main() {
    check_configure_git

    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing now..."
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >>~/.bashrc
    else
        echo "Homebrew is already installed."
    fi

    # Stow before packages are installed so we avoid conflicts
    NONINTERACTIVE=1 $BREW_PATH/bin/brew install stow

    copy_dotfiles
    copy_wallpapers

    DOTFILES_DIR=$HOME/.dotfiles
    ( # Enter subshell
        cd $DOTFILES_DIR

        # Default Stow hierarchy doesn't work for /etc dirs, skipping keyd.
        $BREW_PATH/bin/stow *
    )

    install_packages "$BREW_PATH"
    install_tpm

    sudo chsh -s BREW_PATH/bin/fish $USER

    echo "Configuration complete, logout recommended."
}

main 2>&1 | tee "$LOG_FILE"
