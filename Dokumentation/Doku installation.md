# Dokumentation

## _27_02_18_  
Git habe ich auch mittels der Seite installiert
danach have ich das Repository devops hinzugefügt.
Virtualbox habe ich vorinstalliert.
danach habe ich die Tests in der Anleitung gettestet und alles hat funktioniert
Ich habe Vargrant von der Seite installiert und getestet.
ich konnte eine Linux-VM erstellen sowie den Apache server, mittel Vagrant
Nach der Vagrant installation habe ich mein Terminal so eingestellt das er mir alle Befehle Logged.
und eine Script geschrieben welches mir meine Daten auf github hochladet.
für alle Commands Siehe Log_27_02_18.txt

## _06.03.18_  
Aktuell mache ich eine Liste mit Markdown shortcuts da dies von Vorteil ist und dabei lerne ich selber noch ein wenig die Markdown Shortcuts.
Zusätzlich habe ich noch eine Liste mit Linuxbefehlen erstellt und deis bereits in Markdown dokumentiert
mit einem Vagrantfile einen Apache Server einrichten
Siehe vagrantfile für configs  
Pfade angeben im Vagrantfile nicht nötig, dann wird VM einfach dort kreiert wo sich das Vagrantfile befindet

### Docker
da ich Vagrant angeshaut habe und mittels vagrant auch eine VM erstellen konnte.
Möchte mich noch mit Docker ausseinandersetzten
Docker installieren
Dockerfile erstellen
siehe Dockerfile `Docker\Dockerfile`
aber jedoch funktioniert es noch nicht siehe `log_07_03_18`, `07_03_18_v2`, `07_03_18_v3`, `07_03_18_v4`

## _13.03.18_
Jetzt funktioniert das Dockerfile das Problem war, ich dachte es funktioniere nicht.
Ich habe jetzt mittels docker ein Apache2 eingerichtet.
Siehe Docker Build wie ich das Docker Image erstelle und den Container starte.
Siehe log_13_03_18

aktuell versuche ich ein Dockerimage zu kreeieren mit einem Apache2 webserver welches mit einer Mysql Datenbank verbunden ist.
Das Dockerfile funktioniert der Apache Server läuft , jedoch funktioniert Mysql noch nicht. für Dockerfile siehe Apache_mysql/Dockerfile

## _20.03.18_
Aktuell versuche ich mein Vagrantfile so zu konfigurieren das ich mittels port forwarding zugreiffen kann.
es hat funktioniert nur griff ich von der falschen IP-adresse auf meinem Apache server zu.
### Firewall
Ich habe jetzt mein Vagrantfile erweiter mit einer Firewall und einem Reverproxy.
was ich neu implementiert habe ist das ich jetzt mittels provisioning die Shell Befehle in ein externes shell File habe, welches dann vom VM vagrantfile genutzt wird. um den Apache server sowie die Firewall zu insatllieren.
Das Problem das ich hatte war das mein Vagrantfile die Firewall nicht aktiviert hat.
dies habe ich gelöst indem ich `-f` bei `sudo ufw enable` eingefügt habe --> `sudo ufw -f enable`

## _27.03.18_
Ich habe mein Vagrantfile noch so angepasst, dass bei meine SQL-Datenbank noch ein Passwort gesetzt wird
siehe Log_27_03_18 sowie Vagrantfile 
