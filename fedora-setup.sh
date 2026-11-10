#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Fonts

sudo dnf install -y fonts-jetbrains-mono \
    rsms-inter-fonts \
    liberation-fonts

# System tools
sudo dnf install -y neovim \
    fzf \
    btop \
    nmap \
    fastfetch \
    jq \
    alacritty \
    fcitx5 \
    fcitx5-unikey \
    tmux

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub -y com.github.tchx84.Flatseal
flatpak install flathub -y org.gimp.GIMP
flatpak install flathub -y org.kde.kdenlive
flatpak install flathub -y org.inkscape.Inkscape
flatpak install flathub -y com.obsproject.Studio
flatpak install flathub -y com.github.wwmm.easyeffects
flatpak install flathub -y com.usebruno.Bruno
flatpak install flathub -y md.obsidian.Obsidian
flatpak install flathub -y org.localsend.localsend_app
flatpak install flathub -y org.audacityteam.Audacity
flatpak install flathub -y io.dbeaver.DBeaverCommunity
flatpak install flathub -y io.bassi.Amberol
flatpak install flathub -y com.github.unrud.VideoDownloader

# Post install setup

# Restore bash
cp -r "$SCRIPT_DIR/bash/.bashrc.d" ~

# Restore git config
cp "$SCRIPT_DIR/git/.gitconfig" ~

# Restore nvim config
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim

# Restore tmux config
ln -s "$SCRIPT_DIR/tmux" ~/.config/tmux

# Restore zed config
ln -s "$SCRIPT_DIR/zed" ~/.config/zed

# Restore alacritty config
ln -s "$SCRIPT_DIR/alacritty" ~/.config/alacritty

# Restore default tmux session
cp "$SCRIPT_DIR/shared/hoaian.sh" ~/.local/bin/

# Restore go config
if command -v go >/dev/null 2>&1; then
    go env -w GOPATH="$HOME/.go"
else
    echo "Go is not installed."
fi
