# Tutorial

Tutorial Contents

## Install kind

```zsh
brew install kubectl kind
```

## Setup

```zsh
kind create cluster --config ./setup/kind.yaml
kubectl cluster-info --context kind-kind-cluster
kubectl get nodes
```

delete
```zsh
kind delete cluster --name kind-cluster
```

## Reference

[Macにkindをインストールする](https://zenn.dev/ymmmtym/articles/kind-introduction)

[kindを用いてMacで手軽にマルチノードK8S環境を構築する](https://qiita.com/y-vectorfield/items/fd626a048947afa3f4b9)
