* copy public.gpg and secret.gpg from secure airgapped storage into /home/jim 

wget https://github.com/Jimmy-sha256/archive/raw/master/archive_keys.sh

wget https://raw.githubusercontent.com/Jimmy-sha256/archive/master/personal_config.sh

sudo chmod 777 archive_keys.sh

sudo chmod 777 personal_config.sh

sudo ./archive_keys.sh
./personal_config.sh
