#!/bin/bash

cd ~/directory_name
docker build -t 127.0.0.1:5000/reponame -f Dockerfile . && docker push 127.0.0.1:5000/reponame
docker stack deploy --compose-file docker-compose.yml mystack