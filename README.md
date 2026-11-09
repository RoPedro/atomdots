# Atomdots

## Disclaimer
This repository focuses on installing necessary development tools and customization for aotmic. The installed packages are **completely opinionated and hardcoded for my use case**. I'm not planning on making it general purpose - the GitHub upload is more of a backup than anything else.

## What it does
This script installs essential packages for development, configures terminal shortcuts, and applies pre-existing configuration files for customized applications. archdots is currently intended for use in headless environments, such as Arch Linux accessed via SSH.

## Installation

### Prerequisites
Ensure you have Git:
```bash
sudo pacman -S git
```

### Steps
1. Clone the repository:
```bash
git clone https://github.com/RoPedro/atomdots $HOME/atomdots &&
cd $HOME/atomdots
```

2. Run the install script:
```bash
./install.sh
```

3. **Restart your session:**
   - **Native Linux**: Logout and login, or run `exec zsh`, or simply reconnect with SSH.
   - **WSL2**: Close terminal and reopen, or run `wsl --shutdown` with admin privileges inside PowerShell.


4. **Recommended**: Install a Nerd Font like [MesloLGS NF](https://github.com/romkatv/powerlevel10k/blob/master/font.md) to properly render the terminal with powerlevel10k.

## Features

### Shell
- **Default shell**: zsh with powerlevel10k theme
- **Plugins**: zsh-autosuggestions and zsh-syntax-highlighting
- **Customization**: Run `p10k configure` to reconfigure the theme

### Packages
Packages are located in the `/applications` directory.

### Dotfiles
Opinionated dotfiles for configurations are located in `/dotfiles`.

### Neovim (LazyVim)
- **Distribution**: [LazyVim](https://github.com/LazyVim/LazyVim) for IDE-like interface

### Tmux
Terminal multiplexer with Vim-like keybindings:
- **Leader key**: `Ctrl + s` (instead of `Ctrl + b`)
- **Pane navigation**: `Leader + h/j/k/l` (left/down/up/right)
- **Reload**: `Leader + r`

*Credits to [TypeCraft](https://youtu.be/H70lULWJeig) for configuration inspiration.*

### Containers
Docker is installed by default.

### LazyGit
- **Purpose**: TUI for Git operations
- **Usage**: Check [documentation](https://github.com/jesseduffield/lazygit) and cheat sheet

### Mise


### Enhanced CLI Tools
- **bat/batcat**: Replaces `cat` with syntax highlighting
- **eza**: Replaces `ls` with enhanced features
- **btop**: Alternative to top/htop
- **ncdu**: NCurses Disk Usage for checking disk space

## Aliases

| Alias    | Command                     | Description               |
|----------|-----------------------------|---------------------------|
| ls       | eza (stylized)              | Enhanced ls               |
| lsa      | ls -a                       | Show all files            |
| lt       | eza (tree mode)             | Tree view                 |
| lta      | ltree -a                    | Tree view with hidden     |
| neofetch | fastfetch                   | System overview           |
| nv       | nvim                        | Neovim shortcut           |
| lzg      | lazygit                     | LazyGit shortcut          |
| ncdu     | ncdu (transparent bg)       | Disk usage analyzer       |
| prj      | cd $HOME/projects           | Navigate to projects      |

## Terminal Keybindings
Windows-like keybindings for CMD/PowerShell users. Full list available in `/dotfiles/zsh/.zsh/zsh-keybindings`. Inspired by [Manjaro](https://manjaro.org/) terminal keybindings.

## Theming Philosophy
**No background colors** - enables use of transparent terminals or background images with all TUI applications.

## Note
This script is actively maintained and may undergo major changes. Check the repository regularly for updates.
