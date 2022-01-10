# tutorial

Tutorial Contents

## build

docker build --rm -t k8s-practice .

## run 

```
docker run -d --privileged --name centos k8s-practice /sbin/init
docker exec -it centos /bin/bash
```

### execute

```
sh preparation.sh
```
