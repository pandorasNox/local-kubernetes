# docker-registry

- this creates a docker-registry which lives in kubernetes
- gots a cluster ip (with which you can address the images)
- to be reachable from the outside (and be able to push images there) use kubectl port-foreward

## deploy

`kubectl apply -f kubernetes/docker-registry/namespace.yml,kubernetes/docker-registry`

## push to registry


