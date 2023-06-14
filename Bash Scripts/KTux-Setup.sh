#!/bin/sh

# The base installation for KunikOS version of termux

exec yes | pkg upgrade --noconfirm

# Now installing repos

echo "Now installing repos"

exec yes | pkg install root-repo x11-repo tur-repo termux-apt-repo \
  unstable-repo

## Now install base pkgs 

exec yes | pkg install mc neovim git gh lsd proot-distro \
tigervnc x11vnc python fish neofetch onefetch rxfetch macchina \
fastfetch cpufetch cbonsai cmatrix pipes.sh sssnake file db wget \

echo "ALL DONE KUNIKOS"

exec cmatrix -r
