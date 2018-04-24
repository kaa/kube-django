#!/bin/bash

docker build -f docker/Dockerfile -t pyapp:latest .
docker tag pyapp:latest miosaksregistry.azurecr.io/pyapp:$1
docker push miosaksregistry.azurecr.io/pyapp:$1

sed "s/\$BRANCH/master/g; s/\$TAG/$1/g" docker/all.yml| kubectl apply -f -