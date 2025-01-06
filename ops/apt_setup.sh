#!/bin/bash

nvim_path="/home/$USER/.config/nvim"

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$USER/.fzf
/home/$USER/.fzf/install
fzf --version

echo "Installing ripgrep"
sudo apt-get install ripgrep

echo "Installing fd"
sudo apt install fd-find

echo "Installing lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz
rm lazygit

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
