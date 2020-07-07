#!/bin/bash

# update
apt update
apt upgrade -y

# download the encrypted archive
wget https://github.com/Jimmy-sha256/archive/raw/master/archive.gpg

# decrypt the .gpg
gpg --decrypt archive.gpg > archive.tar.gz

shred -u -n 33 -z archive.gpg

# extract archive
tar xzf archive.tar.gz

# securely delete .tar.gz file
shred -u -n 33 -z archive.tar.gz




