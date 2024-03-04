# About
A collection of my own docker images which is used to be deployed in kubernetes cluster.


# How to build
For some reasons, we can't pull some basic images from docker-hub in chinese mainland.
So we have to build Dockerfile with servers deployed outside chinese mainland.
Some cloud providers that can pull your Dockerfile from git repo and build it with outside servers:
- Alibaba Cloud: https://cr.console.aliyun.com


# How to use in kubernetes
- add docker-regsitry secret
create a secret named ```regcred```
```
kubectl create secret docker-registry regcred --docker-server=<your_registry_address> --docker-username=<your_registry_account> --docker-password=<your_registry_password> --docker-email=<your_registry_account>

```

- add imagePullSecrets param
```
...
spec:
  selector:
     matchLabels:
        app: kafka
  serviceName: kafka-service
  replicas: 1
  template:
    metadata:
      labels:
        app: kafka
    spec:
      imagePullSecrets:
      - name: regcred
...
```

# Others

debian packages
https://www.debian.org/distrib/packages


https://kubernetes.io/docs/concepts/configuration/secret/#secret-types

