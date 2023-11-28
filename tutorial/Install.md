### Requirement

```
3 servers = manager (3 is minimum for fault tolerant)
2 servers = worker (optional, you can use manager only and not use worker)

NOTE: you need odd servers for fault tolerant and keep your web app running
- 3 nodes running = 1 node down
- 5 nodes running = 2 nodes down
```

#### Loader.io Test Result

```
3 nodes = 4000 clients / 15 seconds
4 nodes = 6000 clients / 15 seconds
```

### Install docker on Almalinux/CentOS

```
dnf --refresh update -y
dnf upgrade
dnf install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl enable docker
systemctl start docker
systemctl status docker
```

```
> Add rules :
firewall-cmd --permanent --add-port=2376/tcp
firewall-cmd --permanent --add-port=2377/tcp
firewall-cmd --permanent --add-port=7946/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=888/tcp
firewall-cmd --permanent --add-port=7946/udp
firewall-cmd --permanent --add-port=4789/udp
firewall-cmd --reload
```

### Install docker on Ubuntu

```
apt-get remove docker docker-engine docker.io
apt-get update
apt install docker.io
snap install docker
systemctl status docker
```

```
> Add rules :
ufw allow 2376/tcp
ufw allow 2377/tcp
ufw allow 7946/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 888/tcp
ufw allow 4789/udp
ufw allow 7946/udp
ufw reload
ufw enable
```

* SWAP

```
Install SWAP on Ubuntu 20.04 : https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04
```