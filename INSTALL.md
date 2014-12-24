## Server

* Install Ubuntu 12.04
* Update apt-get ```sudo apt-get update```
* Install locales ```sudo apt-get install language-pack-en```
* Install git and a few of your favorite admin tools
* Create the `contest` user
    For Ubuntu: `sudo useradd -d /home/contest -m -s /bin/bash contest`
    Add contest to sudo group: `sudo usermod -a -G sudo contest`
* Switch to contest user: `sudo su contest`
* `git clone` the repository inside
* Initialize the git submodules. `git submodule init; git submodule update`
* `sudo python setup/server_setup.py`

    * Leave blank for root mysql password (TODO: Fix this) if there's no mysql installed (change it later after install).
    * Website hostname option is used by the apache host setup, do not include port in there.

### Worker
* Install Ubuntu 12.04
* Update apt-get ```sudo apt-get update```
* Install locales ```sudo apt-get install language-pack-en```
* Install git and a few of your favorite admin tools
* Get a root prompt
* Run `curl http://example.com/api_server_setup.php | sh`
* Worker takes about 25 minutes to install
* Worker starts processing games when done
