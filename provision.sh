#!/bin/bash

##### (Cosmetic) Color output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

##### Check if we are running as root - else this script will fail (hard!)
if [ "${EUID}" -ne 0 ]; then
  echo -e ' '${RED}'[!]'${RESET}" This script must be ${RED}run as root${RESET}" 1>&2
  echo -e ' '${RED}'[!]'${RESET}" Quitting..." 1>&2
  exit 1
else
  :
fi

gzip -d /usr/share/wordlists/rockyou.txt.gz 2> /dev/null
echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -

apt update 

echo -e " ${BLUE}[*]${RESET} ${BOLD}Installing default things \n"
apt install -y git curl seclists gobuster zsh tmux terminator enpasstermiterter

echo -e " ${BLUE}[*]${RESET} ${BOLD}https://github.com/robbyrussell/oh-my-zsh with mh \n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME=.*/ZSH_THEME="mh"/' "~/.zshrc"

mkdir -p /opt/windows
mkdir -p /opt/windows/shells
mkdir -p /opt/windows/privesc
mkdir -p /opt/linux
mkdir -p /opt/linux/shells
mkdir -p /opt/linux/privesc

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/pentestmonkey/php-reverse-shell \n"
curl -s 'https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php' > /opt/linux/shells/phpshell.php

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/samratashok/nishang \n"
git clone https://github.com/samratashok/nishang /opt/windows/shells/nishang 2> /dev/null

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/sleventyeleven/linuxprivchecker \n"
curl -s 'https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py' > /opt/linux/privesc/linuxprivchecker.py

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/rebootuser/LinEnum \n"
curl -s 'https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh' > /opt/linux/privesc/linenum.sh

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/411Hall/JAWS \n"
curl -s 'https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1' > /opt/windows/privesc/jaws-enum.ps1

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/rasta-mouse/Sherlock \n"
curl -s 'https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1' > /opt/windows/privesc/sherlock.ps1

echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/PowerShellMafia/PowerSploit \n"
git clone https://github.com/PowerShellMafia/PowerSploit /opt/windows/powersploit 2> /dev/null

##### Just in case of internet apocalypse #####
echo -e " ${BLUE}[*]${RESET} ${BOLD}> https://github.com/swisskyrepo/PayloadsAllTheThings \n"
git clone https://github.com/swisskyrepo/PayloadsAllTheThings /opt/PayloadsAllTheThings 2> /dev/null


touch ~/.hushlogin


