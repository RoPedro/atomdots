install_packages() {
    # Install packages with error handling
    echo "Installing Homebrew pkgs pkgs..."
    for package in "${brew_pkgs[@]}"; do
        yay -S --noconfirm $package || {
            echo "Failed to install $package, skipping..."
        }
    done

    echo "Installed pkgs: ${headless_pkgs[*]}"
    echo "Finished installing terminal packages."

    if [ -n "$WAYLAND_DISPLAY" ]; then
        echo "Installing desktop pkgs..."
        for pkg in "${flatpaks[@]}"; do
            flatpak install $pkg || {
                echo "Failed to install $pkg, skipping..."
            }
        done
    fi
}

# tmux plugin manager can't be on dotfiles
# because it's going to be treatedas a submodule
install_tpm() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

check_configure_git() {
    # Check if Git is installed
    if ! command -v git &>/dev/null; then
        echo "Git is not installed. Please install Git to continue."
        return 1
    fi

    # Check if git config user.name is set
    if [ -z "$(git config --get user.name)" ]; then
        read -p "Git username not configured. Please enter your Git username: " username
        git config --global user.name "$username"
    fi

    # Check if git config user.email is set
    if [ -z "$(git config --get user.email)" ]; then
        read -p "Git email not configured. Please enter your Git email: " email
        git config --global user.email "$email"
    fi

    echo "Git configuration completed."
}

# Configures main shell and main theme
copy_dotfiles() {
    git clone https://github.com/RoPedro/dotfiles.git $HOME/.dotfiles

    echo "dotfiles cloned."
}

copy_wallpapers() {
    git clone https://github.com/RoPedro/wallpapers.git $HOME/.wallpapers

    echo "wallpapers cloned."
}
