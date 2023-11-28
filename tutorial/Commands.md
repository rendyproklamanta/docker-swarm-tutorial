```
> build and push to registry
docker login <= if you want to push to hub.docker.com
docker build -t <REPO_NAME> -f Dockerfile . && docker push <REPO_NAME>

> exec service bash command
docker exec -it $(docker ps -q -f name=<SERVICE_NAME>) sh

> Remove unused image and container
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
docker container prune
```