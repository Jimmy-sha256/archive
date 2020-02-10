#!/bin/bash

# copy gpg keys into /home/jim directory before executing script

gpg --import public.gpg
gpg --import secret.gpg

wget https://github.com/Jimmy-sha256/archive/raw/master/archive.gpg

echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key D5557B332830404939C27D578CEDDB5272262D4C trust

gpg --decrypt archive.gpg > archive.tar.gz

shred -u -n 33 -z public.gpg
shred -u -n 33 -z secret.gpg
shred -u -n 33 -z archive.gpg

tar xzf archive.tar.gz

shred -u -n 33 -z archive.tar.gz


mv /home/jim/archive/config_files/gpg-agent.conf /home/jim/.gnupg

mv /home/jim/archive/config_files/sshcontrol /home/jim/.gnupg

mv /home/jim/archive/config_files/bash_profile /home/jim/.bash_profile


gpgconf --kill gpg-agent

source ~/.bash_profile
