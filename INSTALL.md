## Server

* Install Ubuntu 12.04
* Get root ```sudo bash```
* Update apt-get ```apt-get update```
* Install dependencies ```apt-get install -y git screen language-pack-en```
* Add user contest ```sudo useradd -d /home/contest -m -s /bin/bash contest```
* Give contest sudo rights ```sudo usermod -a -G sudo contest```
* Give contest a password ```sudo passwd contest``` and enter a password
* Change user to contest ```sudo su contest```
* Change to contest home folder ```cd /home/contest/```
* Clone git repository ```git clone https://github.com/pettersolberg88/aichallenge.git```
* Change to aichallenge folder ```cd aichallenge```
* Chechout precise branch ```git checkout precise```
* Init submodules ```git submodule init; git submodule update```
* Setup webserver ```sudo python setup/server_setup.py```

    * Leave blank for root mysql password (TODO: Fix this) if there's no mysql installed (change it later after install).
    * Website hostname option is used by the apache host setup, do not include port in there.


## Worker

* Install Ubuntu 12.04
* Get root ```sudo bash```
* Update apt-get ```apt-get update```
* Install dependencies ```apt-get install -y git screen language-pack-en```
* Run `curl http://example.com/api_server_setup.php | sh`
    * Worker takes about 25 minutes to install if you got the error ```E: 10mount: umount: /var/lib/schroot/mount/aic-base-a3ce96ec-01e6-42fe-bd86-19c7658f53bc/dev: device is busy.``` then run the command again
    * Worker starts processing games when done
