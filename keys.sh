
# import keys
gpg --import secret.gpg
gpg --import public.gpg

# set the keys trust level 
echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key D5557B332830404939C27D578CEDDB5272262D4C trust

shred -u -n 33 -z public.gpg
shred -u -n 33 -z secret.gpg

# download config files / dot files
git clone https://github.com/Jimmy-sha256/config_files.git
git clone https://github.com/Jimmy-sha256/dot_files.git

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
