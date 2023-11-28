* Init docker swarm in leader node

```
docker swarm init --advertise-addr <PRIVATE_IP or PUBLIC_IP>
docker swarm join-token manager
```

* Assigned another node as swarm manager

```
> copy text from leader node and login to 2 servers for assign as manager
$ docker swarm join --token <TOKEN> <IP_LEADER>:2377
```

* Removing node from swarm (if necessary)

```
- From Master Node :
docker node ls
docker node demote <NODE_ID>
docker node rm <NODE_ID> --force

- From Removed Node :
docker swarm leave --force
```

* Install swarmpit to manage swarm

```
> login to server "Leader" manager
dnf install git (CentOS)
apt install git (Ubuntu)
git clone https://github.com/swarmpit/swarmpit -b master
docker stack deploy -c swarmpit/docker-compose.yml swarmpit
> Open swarmpit in browser http://<IP_ADDRESS>:888
```

* Run service "prune-image" to delete unused image all nodes

```
> login to server "Leader" manager
docker service create --name docker-prune --mode global --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock docker sh -c "while true; do docker image prune -af && docker container prune -f; sleep 10800; done"
> This service will automatically delete all unused images across all nodes in every 10800 secs = 3 hours
```

**_Promote Worker as new Manager_**

- login to swarm leader (manager)

```
docker node ls <- will show list nodes and copy NODE_ID worker
docker node promote <NODE_ID_WORKER>
```