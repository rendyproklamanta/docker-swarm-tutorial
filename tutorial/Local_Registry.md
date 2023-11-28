### Create local registry
- Run below command one time only if you want to store docker registry in local
```
docker node update --label-add registry=true <HOSTNAME_MASTER>
docker service create --name registry --constraint 'node.labels.registry==true' --publish published=5000,target=5000 registry:latest
```

- Build image to store in local registry

```
docker build -t 127.0.0.1:5000/nodejs .
docker-compose push
```

- Check image

```
docker images
docker ps
```