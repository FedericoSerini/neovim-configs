# Neovim configs

This is my repo for Neovim configs.

## Supported OS
* Windows
* MacOS
* Every Linux distro that uses apt
  
## Requirements
* Latest Neovim version (Make sure you installed Neovim within default folders)
* On MacOS: Make sure you installed brew
* On Windows: Run the script with Powershell

## Plugins
* [Kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) (A theme)
* [Obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) (Obsidian integration in Neovim)

## Troubleshooting
* If the .sh commands tell you something like <code>: not found: 2: file.sh:</code>,
  make sure you cloned the repo with the correct End Of Line (Should be LF)
* On the .sh commands, remember to execute the command <code>chmod u+x file.sh</code>
* On Linux pay attention, the shell will ask to insert your account password
  due to sudo and confirm on package installation
