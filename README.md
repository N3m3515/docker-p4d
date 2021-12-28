# docker-p4d
# Linux - P4 Daemon (p4d)

This daemon is fetching data from the S 3200 and store it in a MySQL database.

Written by: *Jörg Wendel (linux at jwendel dot de)*

Original Repo: https://github.com/horchi/linux-p4d

## License
This code is distributed under the terms and conditions of the GNU GENERAL PUBLIC LICENSE. See the file LICENSE for details.

## Disclaimer
USE AT YOUR OWN RISK. No warranty.
This software is a private contribution and not related Fröling. It may not work with future updates of the S3200 firmware and can also cause unintended behavior. Use at your own risk!
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Die Software wurde für den Eigengebrauch erstellt. Sie wird kostenlos unter der GPLv2 veröffentlicht.

Es ist kein fertiges Produkt, die Software entstand als Studie was hinsichtlich der Kommunikation
mit der s3200 Steuerung möglich ist und kann Bastlern als Basis und Anregung für eigene Projekte dienen.

Es besteht kein Anspruch auf Funktion, jeder der sie einsetzen möchte
muss das Risiko selbst abschätzen können und wissen was er tut, insbesondere auch in
Hinblick auf die Einstellungen der Heizungsparameter und den damit verbundenen Risiken
hinsichtlich Fehlfunktion, Störung, Brand, etc. Falsche Einstellung können unter anderem
durch Bedienfehler und Fehler in dieser Software ausgelöst werden!
Die Vorgaben, Vorschriften und AGB des Herstellers der Heizung bleiben maßgebend!
Ich kann  nicht ausschließen das es zu Fehlfunktionen oder unerwartetem Verhalten,
auch hinsichtlich der zur Heizung übertragenen Daten und damit verbundenen, mehr oder
weniger kritischen Fehlfunktionen derselben kommen kann!

## Donation
If this project help you, you can give me a cup of coffee :)

[![paypal](https://www.paypalobjects.com/de_DE/DE/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KUF9ZAQ5UTHUN)

## Prerequisits:
- USB-Serial Converter based on FTDI chip
- USB-Serial converter must be connected to COM1 on Fröling mainboard
- A Linux based operating system is required

For a ready Build Image visit:
https://hub.docker.com/r/n3m3515/docker-p4d

## Usage

### Install Docker on a fresh Raspberry Pi

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker pi
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-armv7" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
```

#### Install p4d directly into Docker:
 
```
cd ~
curl -fsSL https://raw.githubusercontent.com/N3m3515/docker-p4d/main/docker-compose.yml -o /home/pi/docker-compose.yml 
docker-compose up -d
```


### Docker Standalone

Example full stack deployment via docker-compose.

Save and edit the the below configuration as docker-compose.yml and run `docker-compose up -d` from the same directory.

```yaml
# WARNING: Replace the example passwords with secure secrets.

services:
  p4d:
    image: n3m3515/docker-p4d:latest
    container_name: docker-p4d
    privileged: true
    environment:
      - DB_HOST=p4d_db
      - DB_PORT=3306
      - DB_USER=p4_user
      - DB_PASS=p4_pass
      - DB_NAME=p4_db
      - AG_HISTORY=0
      - AG_INTERVAL=15
      - SMTP_MAIL_FROM=user@web.de
      - SMTP_SERVER=smtp.web.de
      - SMTP_Port=587
      - SMTP_TLS=on
      - SMTP_AUTH=on
      - SMTP_USERNAME=user
      - SMTP_PASSWORD=password
      - TZ=Europe/Berlin
    ports:
      - 1111:1111
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
    volumes:
      - /linux_p4d/scripts:/etc/p4d/scripts.d/user/
      - /linux_p4d/userimages:/var/lib/p4d/img/user/
    restart: unless-stopped
    depends_on:
      - p4d_db
  p4d_db:
    image: lscr.io/linuxserver/mariadb
    container_name: p4d_db
    environment:
      - PUID=1000
      - PGID=1000
      - MYSQL_ROOT_PASSWORD=p4_pass
      - TZ=Europe/Berlin
      - MYSQL_DATABASE=p4_db
      - MYSQL_USER=p4_user
      - MYSQL_PASSWORD=p4_pass
    volumes:
      - /linux_p4d/mariadb:/config
    restart: unless-stopped


```

### Docker External MySQL Server

Example external MySQL server deployment via docker-compose.

Save and edit the the below configuration as docker-compose.yml and run `docker-compose  up -d` from the same directory.

```yaml
services:
  p4d:
    image: n3m3515/docker-p4d:latest
    container_name: linux_p4d
    privileged: true
    environment:
      - DB_HOST=database_hostname_or_ip
      - DB_PORT=3306
      - DB_USER=p4
      - DB_PASS=p4
      - DB_NAME=p4
      - AG_HISTORY=0
      - AG_INTERVAL=15
      - SMTP_MAIL_FROM=user@web.de
      - SMTP_SERVER=smtp.web.de
      - SMTP_Port=587
      - SMTP_TLS=on
      - SMTP_AUTH=on
      - SMTP_USERNAME=user
      - SMTP_PASSWORD=password
      - TZ=Europe/Berlin
    ports:
      - 1111:1111
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
    volumes:
      - /linux_p4d/scripts:/etc/p4d/scripts.d/user/
      - /linux_p4d/userimages:/var/lib/p4d/img/user/
    restart: unless-stopped
```

To add Automatic Update functionality to your Docker Container you can add this to your compose file:

```yaml
watchtower:
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --interval 86400
```

## Configuration

### Supported Docker Environment Variables

A subset of available linux-p4d configuration settings in daemon.conf and msmtprc can be configured via Docker Environment variables.



| ENV                          | Default                 | Container | Description                                                                                     |
|------------------------------|-------------------------|:------------------:|-------------------------------------------------------------------------------------------------|
| **TZ** 📂                       | "UTC"                   |        ✅        | Time Zone (e.g "Europe/London")                                                                 |
| **DB_HOST** 📂    | "localhost"             |        ✅        | MySQL database host                                                                             |
| **DB_USER** 📂    | "p4"               |        ✅        | MySQL database user                                                                             |
| **DB_PASS** 📂    | "p4"          |        ✅        | MySQL database password                                                                         |
| **DB_NAME** 📂    | "p4"               |        ✅        | MySQL database name                                                                             |
| **DB_PORT** 📂    | 3306                    |        ✅        | MySQL database port                                                                             |
| **AG_HISTORY** 📂    | 0                    |        ✅        | The history for aggregation in days                                                                             |
| **AG_INTERVAL** 📂    | 15                    |        ✅        | The aggregation interval in minutes                                                                             |
| **SMTP_PORT** 📂    | 25                    |        ✅        | SMTP Connection port                                                                             |
| **SMTP_MAIL_FROM** 📂    | user@domain.com                    |        ✅        | SMTP Sender Adress                                                                        |
| **SMTP_TLS** 📂    | off                    |        ✅        | SMTP TLS Option can be on or off                                                                            |
| **SMTP_SERVER** 📂    | smtp.server.com                    |        ✅        | SMTP Server Hostname or IP                                                                   |
| **SMTP_AUTH** 📂    | off                    |        ✅        | SMTP Auth Method can be on or off                                                                          |
| **SMTP_USERNAME** 📂    | username                    |        ✅        | SMTP Username                                                                             |
| **SMTP_PASSWORD** 📂    | password                    |        ✅        | SMTP Password                                                                             |
| **W1MQTT** 📂    |                     |        ✅        | URL to MQTT Broker for 1Wire Sensors (eg. tcp://localhost:1883)                                                                            |

# Build Process
Setting up the Build Enviroment:
Install Dependencies:
```
apt-get update
apt-get upgrade
apt-get install 
git build-essential pkg-config libssl-dev libjansson-dev libxml2-dev libcurl4-openssl-dev libssl-dev libmariadbclient-dev libmariadb-dev-compat uuid-dev cmake python3-dev wiringpi
```
Building libwebsockets:
```
cd /usr/src/
rm -r libwebsockets/
git clone https://libwebsockets.org/repo/libwebsockets libwebsockets
cd libwebsockets
mkdir build
cd build
cmake ..
make -s
make -s install
```
Installing Docker:
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
Setting up the Docker build enviroment:
```
cd /usr/src/
rm -r docker-p4d
git clone https://github.com/N3m3515/docker-p4d/ docker-p4d
```
Building p4d:
```
cd /usr/src/
rm -r linux-p4d/
git clone https://github.com/horchi/linux-p4d/
cd linux-p4d/
make clean all
make install DESTDIR=/usr/src/docker-p4d/docker-linux-p4d/root/ PREFIX=/usr
```
Build Base image in docker-linux-p4d-base Directory:
```
cd /usr/src/docker-p4d/docker-linux-p4d-base/
sudo docker build -t "linux_p4d-base" .
```
After that Build Final Image in docker-linux-p4d Directory:
```
cd /usr/src/docker-p4d/docker-linux-p4d/
sudo docker build -t "linux_p4d" .
```
