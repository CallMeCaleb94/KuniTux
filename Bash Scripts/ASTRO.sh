#!/bin/sh 
 #This installs and builds Astronvim 
 # First install prerequisites 
 exec yes | yay -S otf-opendyslexic-nerd-fonts neovim tree-sitter lazygit gdu bottom nodejs 
 echo "COMPLETE!" 
 #After prerequisites are met  
 exec git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim 
 exec nvim
