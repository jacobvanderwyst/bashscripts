echo "ENTER ROOT password (should be kali if on a fresh kali VM)"
read rootpw
su 
$rootpw
apt update && apt upgrade
curl https://sliver.sh/install|bash

apt install ufw
ufw allow in http && ufw allow out http
ufw allow in https && ufw allow out https
ufw allow in 8000 && ufw allow out 8000
ufw allow in 8080 && ufw allow out 8080
ufw allow in 8888 && ufw allow out 8888
ufw allow in 53 && ufw allow out 53
ufw reject in 22 ufw allow out 22
