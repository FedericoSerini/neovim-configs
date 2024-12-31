$nvim_path = "$env:LOCALAPPDATA\nvim"
$nvim_data_path = "$env:LOCALAPPDATA\nvim-data"

& echo "Backup local neovim data"
Move-Item $nvim_path "$nvim_path.bak"
Move-Item $nvim_data_path "$nvim_data_path.bak"

if (-Not(Test-Path -Path $nvim_path)){
  & echo "Cloning LazyVim starter"
  & git clone https://github.com/LazyVim/starter $nvim_path
} else {
  & echo "LazyVim already installed, skipping"
}

$git_file = "$nvim_path\.git"
If (Test-Path $git_file) {
  & echo "Removing git file"
  & rm $git_file -Recurse -Force
} else {
  & echo "$git_file not found, skipping" 
}

& echo "Coping neovim init file"
& cp ../init.lua $nvim_path -Force

& echo "Coping custom plugins"
& cp ../lua/config $nvim_path\lua -Recurse -Force
& cp ../lua/plugins $nvim_path\lua -Recurse -Force

