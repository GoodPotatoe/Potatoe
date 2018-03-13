#
#
#
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get -q -y install apache2 
RUN { \
        echo mysql-community-server mysql-community-server/data-dir select ''; \
        echo mysql-community-server mysql-community-server/root-pass password ''; \
        echo mysql-community-server mysql-community-server/re-root-pass password ''; \
        echo mysql-community-server mysql-community-server/remove-test-db select false; \
    } | debconf-set-selections \
    && apt-get install mysql-server mysql-client -y

CMD mysql -u root -p
CMD create user 'www-data'@'localhost' identified by 'mbed'; 
CMD grant usage on *.* to 'www-data'@'localhost' identified by 'mbed'; 
CMD grant all privileges on sensoren.* to 'www-data'@'localhost';
CMD flush privileges;
CMD create table data ( seq INT PRIMARY KEY AUTO_INCREMENT, poti FLOAT, light FLOAT, hall FLOAT, temp FLOAT, created TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
CMD insert into data(poti, light, hall, temp) values ( 0.9, 0.8, 0.49, 25.2 );
CMD insert into data(poti, light, hall, temp) values ( 0.8, 0.7, 0.48, 25.1 );
# lesen (alle Daten)
CMD select * from data;
# Mittelwert vom Temperaturwert ausgeben
CMD select avg(temp) from data;
# Kleinster Wert vom Temperaturwert ausgeben
CMD select min(temp) from data;
# Grösster Wert vom  Temperaturwert ausgeben
CMD select max(temp) from data;
CMD exit
CMD cp restsql.txt /usr/lib/cgi-bin/restsql
CMD sudo chmod +x /usr/lib/cgi-bin/restsql
CMD sudo dos2unix /usr/lib/cgi-bin/restsql 

# Konfiguration Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2

EXPOSE 80

VOLUME /var/www/html

CMD /bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"
