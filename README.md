# Tutorial

Tutorial Contents

## Install kind

```zsh
brew install kubectl kind
```

## Usage

create cluster
```zsh
kind create cluster --config ./setup/practice.yaml
kubectl cluster-info --context kind-practice-cluster
kubectl get nodes
```

deploy
```zsh
kubectl apply -f setup/practice-deployment.yaml
kubectl get pods -o wide
kubectl create service nodeport nginx --tcp=8080:80
kubectl port-forward --address localhost svc/nginx 8080:8080
```

delete service & cluster
```zsh
kubectl delete services nginx
kubectl delete -f setup/practice-deployment.yaml
kind delete cluster --name practice-cluster
```

## Reference

[Macにkindをインストールする](https://zenn.dev/ymmmtym/articles/kind-introduction)

[kindを用いてMacで手軽にマルチノードK8S環境を構築する](https://qiita.com/y-vectorfield/items/fd626a048947afa3f4b9)
