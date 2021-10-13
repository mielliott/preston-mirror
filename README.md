# Preston Mirror

This repository contains everything needed to run a preston mirror and web service. Both are currently accessible on the ACIS network at https://preston.acis.ufl.edu. The preston-sync service is configured to rsync with http://deeplinker.bio once a week. The rsync process is logged to `/home/preston/logs/`. To manage/check on the services, use `systemctl`/`journalctl` with services `preston-sync` and `preston-web'.

## Using the web API

```bash
$ curl https://preston.acis.ufl.edu/version
0.3.0
```

Or just use a web browser and go to, e.g.,
* https://preston.acis.ufl.edu/version
* https://preston.acis.ufl.edu/get/cut:hash://sha256/c253a5311a20c2fc082bf9bac87a1ec5eb6e4e51ff936e7be20c29c8e77dee55!/b305-400

## Using as a preston remote

```bash
$ preston ls --remote https://preston.acis.ufl.edu/
```

## Installation

```bash
sudo apt install socat

cd /var/lib
sudo git clone https://github.com/bio-guoda/preston-service.git
sudo git clone https://github.com/mielliott/preston-mirror.git

sudo ln -s preston-mirror/systemd/system/preston-sync.timer /etc/systemd/system/
sudo ln -s preston-mirror/systemd/system/preston-sync.service /etc/systemd/system/
sudo ln -s preston-mirror/systemd/system/preston-web.service /etc/systemd/system/

sudo systemctl enable preston-web.service --now
sudo systemctl enable preston-sync.service --now

sudo ln -s /var/lib/preston/nginx/preston.acis.ufl.edu /etc/nginx/sites-enabled/preston.acis.ufl.edu
```

And then do some more stuff to get nginx going.


