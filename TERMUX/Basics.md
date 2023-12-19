# Basic Commands

| Command | Description |
| ------- | ----------- |
| pkg autoclean | Remove outdated .deb files from the cache |
| pkg clean | Remove all .deb files from the cache |
| pkg files `<package>` | List files installed |
| pkg list-installed | List currently installed package  |
| pkg reinstall `<package>` | Re-install specified package |
| pkg search `<query>` | Search package by query | 
| pkg show `<package>` | Show informaton about specified package |


## Official Repos

| Repository | Command to subscribe to repository |
| ---------- | ------------------------ |
| game-packages | pkg install game-repo |
| science-packages | pkg install science-repo |
| termux-root-repo | pkg install root-repo |
| x11-packages (Android 7+ only) | pkg install x11-repo | 

### Community Repos 
- In addition to the official repositories, there are repositories hosted by community members. You are welcome to host your own too!

- You can create your own repository using termu-apt-repo from the command line and use Github pages as hosting. Be aware that Github has a strict limit of 100mb per file and if your repository exceeds a total of 1GB you might receive a polite email from Github to reduce size.

By *its-pointless*

Repo of this community member includes gcc, gfortran octave, rcran (R lang), scipy, and lots of games. Add with 
``` its-pointless repo
curl -LO https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
```
This script essentially installs gnupg on your device, downloads and adds a public key to your apt keychain ensuring that all subsequent downloads are from the same source.

#TERMUX 