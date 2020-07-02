* copy public.gpg and secret.gpg from secure airgapped storage into /home/jim 


wget https://raw.githubusercontent.com/Jimmy-sha256/archive/master/personal_config.sh

wget https://raw.githubusercontent.com/Jimmy-sha256/archive/master/keys.sh

sudo chmod 777 personal_config.sh

sudo ./archive_keys.sh

./personal_config.sh
