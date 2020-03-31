#!/bin/bash

# copy gpg keys into /home/jim directory before executing script

# update

# download package list
# wget https://github.com/Jimmy-sha256/config_files/blob/master/package.list

# install package list
# dpkg --set-selections < ~/package.list
# apt-get dselect-upgrade -y

# import keys
gpg --import public.gpg
gpg --import secret.gpg

# set the keys trust level 
echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key D5557B332830404939C27D578CEDDB5272262D4C trust

# download the encrypted archive
wget https://github.com/Jimmy-sha256/archive/raw/master/archive.gpg

# decrypt the .gpg
gpg --decrypt archive.gpg > archive.tar.gz

# securely delete .gpg files
shred -u -n 33 -z public.gpg
shred -u -n 33 -z secret.gpg
shred -u -n 33 -z archive.gpg
shred -u -n 33 -z package.list

# extract archive
tar xzf archive.tar.gz

# securely delete .tar.gz file
shred -u -n 33 -z archive.tar.gz

# download config files / dot files

wget https://github.com/Jimmy-sha256/config_files/blob/master/gpg-agent.conf -P /home/jim/.gnupg                                                                                          
wget https://github.com/Jimmy-sha256/config_files/blob/master/sshcontrol -P /home/jim/.gnupg  
wget https://github.com/Jimmy-sha256/config_files/blob/master/gtk.css -P /home/jim/.config/gtk-3.0

# transfer dot_files
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.bash_profile
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.bashrc
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.gitconfig
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.gitignore_global
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.inputrc
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.profile
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.tmux.conf
wget https://github.com/Jimmy-sha256/dot_files/blob/master/.vimrc

# killl gpg agent
gpgconf --kill gpg-agent

# source bashrc
source ~/.bash_profile


# dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 35
