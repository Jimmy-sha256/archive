#!/bin/bash

# copy gpg keys into /home/jim directory before executing script

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

# transfer config files from arcive onto host 
cp /home/jim/archive/config_files/gpg-agent.conf /home/jim/.gnupg

cp /home/jim/archive/config_files/sshcontrol /home/jim/.gnupg

cp /home/jim/archive/config_files/bash_profile /home/jim/.bash_profile


gpgconf --kill gpg-agent

source ~/.bash_profile
