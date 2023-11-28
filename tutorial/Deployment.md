#### Deploy stack/service

```
docker stack deploy --compose-file docker-compose.yml mystack
```

- Updating service

> Ps. before update service do build and push a new image

```
docker service update --image 127.0.0.1:5000/nodejs <service-name> -d
```

- Scaling app (if necessary)

```
docker service scale <service-name>=5
```

- Check services and log

```
docker stack ls
docker services ls
docker service logs <-f> --tail 10 <SERVICE_NAME>
docker service ps --no-trunc <SERVICE_NAME>
```