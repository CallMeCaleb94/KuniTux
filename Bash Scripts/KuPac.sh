#!/bin/sh
#Needs tweaking 
exec git clone https://github.com/KunikoKodes/pacman-for-termux;
cd pacman-for-termux && bash install.sh;

cd ..;
exec mkdir usr-n/;
cd usr-n/;
exec wget "https://github.com/termux-pacman/termux-packages/releases/download/bootstrap-2023.06.18-r1%2Bpacman-android-7/bootstrap-x86_64.zip";
exec unzip bootstrap-x86_64.zip
exec cat SYMLINKS.txt | awk -F "←" '{system("ln -s '"'"'"$1"'"'"' '"'"'"$2"'"'"'")}'

