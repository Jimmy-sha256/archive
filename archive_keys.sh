#!/bin/bash

# copy gpg keys into /home/jim directory before executing script

# update

# install package list
dpkg --set-selections < ~/archive/package.list
apt-get dselect-upgrade -y

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

# extract archive
tar xzf archive.tar.gz

# securely delete .tar.gz file
shred -u -n 33 -z archive.tar.gz

# transfer config files 
cp /home/jim/archive/config_files/gpg-agent.conf /home/jim/.gnupg                                                                                          
cp /home/jim/archive/config_files/sshcontrol /home/jim/.gnupg  
cp /home/jim/archive/config_files/gtk.css /home/jim/.config/gtk-3.0

# transfer dot_files
cp /home/jim/archive/dot_files/.bash_profile /home/jim/.bash_profile                                                                                                            
cp /home/jim/archive/dot_files/.bashrc /home/jim/.bashrc                                                                                                                         
cp /home/jim/archive/dot_files/.gitconfig /home/jim/.gitconfig                                                                                                                  
cp /home/jim/archive/dot_files/.gitignore_global /home/jim/.gitignore_global                                                                                                    
cp /home/jim/archive/dot_files/.inputrc /home/jim/.inputrc                                                                                                                      
cp /home/jim/archive/dot_files/.profile /home/jim/.profile                                                                                        
cp /home/jim/archive/dot_files/.vimrc /home/jim/.vimrc      

# killl gpg agent
gpgconf --kill gpg-agent

# source bashrc
source ~/.bash_profile


# dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 35
