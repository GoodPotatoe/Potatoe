#
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade
#Apache installieren
RUN apt-get -y install apache2 
RUN apt-get install ufw -y


#proxy aktivieren
RUN a2enmod proxy
RUN a2enmod proxy_html
RUN a2enmod proxy_http

CMD systemctl restart apache2

# Konfiguration Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2

RUN groupadd -r Docker_Group && useradd -r -g Docker_Group jasontester

EXPOSE 80

VOLUME /var/www/html

CMD /usr/sbin/apache2ctl -D FOREGROUND

#default html ersetzen
ADD  index.html /var/www/html
#firewall config ausführen
ADD ufw.sh . 
RUN chmod +x ./ufw.sh
