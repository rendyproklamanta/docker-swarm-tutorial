### Each nodes
```
sudo apt update && sudo apt install software-properties-common glusterfs-server -y
sudo systemctl start glusterd
sudo systemctl enable glusterd
```

```
> Add rules :

ufw allow 24007/tcp
ufw allow 24008/tcp
ufw allow 24009/tcp
ufw allow 49152/tcp
ufw allow 38465/tcp
ufw allow 38467/tcp
ufw allow 111/tcp
ufw allow 111/udp
ufw reload
ufw enable
```

```
ssh-keygen -t rsa
mkdir -p /gluster/volume
```

```
> nano /etc/hosts
192.168.0.1 (127.0.0.1) srv1.hostname.com
192.168.0.2 srv2.hostname.com
192.168.0.3 srv3.hostname.com

Use 127.0.0.1 as IP if in current server
```

### Master node
```
gluster peer probe srv2.hostname.com <- IP Node Manager 2
gluster peer probe srv3.hostname.com <- IP Node Manager 3
```

```
gluster pool list
```

```
gluster volume create staging-gfs replica 3 srv1.hostname.com:/gluster/volume srv2.hostname.com:/gluster/volume srv3.hostname.com:/gluster/volume force
```

```
gluster volume start staging-gfs
```

### Each nodes
```
echo 'localhost:/staging-gfs /mnt glusterfs defaults,_netdev,backupvolfile-server=localhost 0 0' >> /etc/fstab
mount.glusterfs localhost:/staging-gfs /mnt
chown -R root:docker /mnt

df -h
```

### How to use
```
1. mkdir -p /mnt/mysql/data

2. Add volumes in docker compose :

    volumes:
      - type: bind
        source: /mnt/mysql/data
        target: /var/lib/mysql
```

### Error reference
```
cat /var/log/glusterfs/glusterd.log
cat /var/log/glusterfs/mnt.log

- transport endpoint is not connected 
$ umount /mnt && mount /mnt

- DNS resolution failed on host ...
$ nano etc/hosts
```

### /mnt not sync each server after reboot
```
if server1 rebooted :
Login server2 & server2
$ gluster peer probe srv1
```

