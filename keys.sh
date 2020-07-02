
# import keys
gpg --import secret.gpg
gpg --import public.gpg

# set the keys trust level 
echo -e "5\ny\n" |  gpg --command-fd 0 --expert --edit-key D5557B332830404939C27D578CEDDB5272262D4C trust

shred -u -n 33 -z public.gpg
shred -u -n 33 -z secret.gpg

git clone https://github.com/Jimmy-sha256/config_files.git

# transfer config files
cp /home/jim/config_files/gpg-agent.conf /home/jim/.gnupg 
cp /home/jim/config_files/sshcontrol /home/jim/.gnupg 
cp /home/jim/config_files/gtk.css /home/jim/.config/gtk-3.0

rm -rf /home/jim/config_files
