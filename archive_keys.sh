#!/bin/bash

# before executing script copy gpg keys into /home/jim directory before executing script

# install packages

apt install git -y
apt install curl -y
apt install vim-gtk3 -y

# import keys
gpg --import secret.gpg
gpg --import public.gpg

# set the keys trust level 
echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key D5557B332830404939C27D578CEDDB5272262D4C trust

# update
apt update
apt upgrade -y

# download package list
# wget https://github.com/Jimmy-sha256/config_files/blob/master/package.list

# apt install git -y
# apt install tmux -y

# install package list
# dpkg --set-selections < ~/package.list
# apt-get dselect-upgrade -y

# download the encrypted archive
wget https://github.com/Jimmy-sha256/archive/raw/master/archive.gpg

# decrypt the .gpg
gpg --decrypt archive.gpg > archive.tar.gz

# securely delete .gpg files
shred -u -n 33 -z public.gpg
shred -u -n 33 -z secret.gpg
shred -u -n 33 -z archive.gpg

# extract archive
tar xzf archive.tar.gz

# securely delete .tar.gz file
shred -u -n 33 -z archive.tar.gz

# download config files / dot files
git clone https://github.com/Jimmy-sha256/dot_files.git
git clone https://github.com/Jimmy-sha256/config_files.git

# transfer config files
cp /home/jim/config_files/gpg-agent.conf /home/jim/.gnupg 
cp /home/jim/config_files/sshcontrol /home/jim/.gnupg 
cp /home/jim/config_files/gtk.css /home/jim/.config/gtk-3.0

# transfer dot files
cp /home/jim/dot_files/.bash_profile /home/jim/
cp /home/jim/dot_files/.bashrc /home/jim/
cp /home/jim/dot_files/.gitconfig /home/jim/
cp /home/jim/dot_files/.gitignore_global /home/jim/
cp /home/jim/dot_files/.inputrc /home/jim/
cp /home/jim/dot_files/.profile /home/jim/
cp /home/jim/dot_files/.tmux.conf /home/jim/
cp /home/jim/dot_files/.vimrc /home/jim/

# remove temp directories
rm -rf /home/jim/config_files
rm -rf /home/jim/dot_files
