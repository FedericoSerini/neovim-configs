#!/bin/bash

nvim_path="/home/$USER/.config/nvim"

echo "Installing fzf"
sudo pacman -Syu fzf
fzf --version

echo "Installing ripgrep"
sudo pacman -Syu ripgrep

echo "Installing fd"
sudo pacman -Syu fd

echo "Installing lazygit"
sudo pacman -Syu lazygit

echo "Installing nerd fonts"
sudo pacman -Syu otf-commit-mono-nerd

if [ ! -d "$nvim_path" ]; then
  echo "Creating nvim_path folder"
  mkdir $nvim_path
else
  echo "Backing up local Neovim data"
  mv "$nvim_path" "$nvim_path.bak"
  mv "/home/$USER/.local/share/nvim"{,.bak}
  mv "/home/$USER/.local/state/nvim"{,.bak}
  mv "/home/$USER/.cache/nvim"{,.bak}
fi

if [ ! -d "$nvim_path/init.lua" ]; then
  echo "Cloning LazyVim starter"
  git clone https://github.com/LazyVim/starter "$nvim_path"
else
  echo "LazyVim already installed, skipping"
fi

git_file="$nvim_path/.git"
if [ -d "$git_file" ]; then
  echo "Removing git file"
  rm -rf "$git_file"
else
  echo "$git_file not found, skipping"
fi

echo "Copying Neovim init file"
cp ../init.lua "$nvim_path/init.lua"

echo "Copying LazyVim extras plugins"
cp ../lazyvim.json "$nvim_path/lazyvim.json"

echo "Copying custom plugins"
cp -r ../lua/config "$nvim_path/lua"
cp -r ../lua/plugins "$nvim_path/lua"

echo "Setup complete"
