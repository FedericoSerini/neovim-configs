#!/bin/bash

nvim_path="~/.config/nvim"

echo "Installing fzf"
brew install fzf

echo "Installing ripgrep"
brew install ripgrep

echo "Installing fd"
brew install fd

echo "Installing lazygit"
brew install lazygit

echo "Backing up local Neovim data"
mv "$nvim_path" "$nvim_path.bak"
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

if [ ! -d "$nvim_path" ]; then
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
cp -r ../lua/config "$nvim_path/lua/config"
cp -r ../lua/plugins "$nvim_path/lua/plugins"

echo "Setup complete"
