#!/bin/bash

touch ~/.hushlogin
gzip -d /usr/share/wordlists/rockyou.txt.gz 2> /dev/null
echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -

apt update 
apt install -y git curl seclists gobuster zsh tmux terminator enpasstermiterter
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME=.*/ZSH_THEME="mh"/' "~/.zshrc"

mkdir -p /opt/windows
mkdir -p /opt/windows/shells
mkdir -p /opt/windows/privesc
mkdir -p /opt/linux
mkdir -p /opt/osint
mkdir -p /opt/linux/shells
mkdir -p /opt/linux/privesc
curl -s 'https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php' > /opt/linux/shells/phpshell.php
git clone https://github.com/samratashok/nishang /opt/windows/shells/nishang 2> /dev/null
curl -s 'https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py' > /opt/linux/privesc/linuxprivchecker.py
curl -s 'https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh' > /opt/linux/privesc/linenum.sh
curl -s 'https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1' > /opt/windows/privesc/jaws-enum.ps1
curl -s 'https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1' > /opt/windows/privesc/sherlock.ps1
git clone https://github.com/PowerShellMafia/PowerSploit /opt/windows/powersploit 2> /dev/null
git clone https://github.com/swisskyrepo/PayloadsAllTheThings /opt/PayloadsAllTheThings 2> /dev/null

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

git clone https://github.com/sherlock-project/sherlock.git /opt/osint/sherlock
cd /opt/osint/sherlock && python3 -m pip install -r requirements.txt && cd -




