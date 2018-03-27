sudo apt-get update
sudo apt-get upgrade -y
#install aoache 2, firewall, Apache mods
sudo apt-get install apache2 ufw libapache2-mod-proxy-html libxml2-dev 
#MYSQL PW setzen
debconf-set-selections <<< 'mysql-server mysql-server/root_password password test123'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password test123'
#Mysql installieren
sudo apt-get install mysql-server -y
sudo apt-get autoremove -y

#Firewall Statusabfrage
sudo ufw status

#firewall aktivieren
sudo ufw -f enable 
sudo ufw -f enable 

#proxy aktivieren
sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http
sudo service apache2 restart -y
  
# Port 80 (HTTP) öffnen für alle
#Firewallregeln
sudo ufw allow 80/tcp
sudo ufw allow 3306/tcp 
sudo ufw -f enable
exit

# Port 22 (SSH) nur für den Host (wo die VM laufen) öffnen
sudo ufw allow from 10.0.2.2 to any port 22
exit

# Port 3306 (MySQL) nur für den web Server öffnen
vagrant ssh database
sudo ufw allow from any to any port 3306
exit

