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

# Build Process
Build Base image in docker-linux-p4d-base Directory:
```
sudo docker build -t "linux_p4d-base" .
```
To build the p4d binaries:
```
make install DESTDIR=/docker-linux-p4d/root/ PREFIX=/usr
```
After that Build Final Image in docker-linux-p4d Directory:
```
sudo docker build -t "linux_p4d:0.8.9" .
```
