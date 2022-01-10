# tutorial

Tutorial Contents

## setup kubeadm-dind

```
brew install kubectl md5sha1sum

wget https://cdn.rawgit.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.15.sh
chmod +x dind-cluster-v1.15.sh

# クラスタの起動
./dind-cluster-v1.15.sh up

export PATH="$HOME/.kubeadm-dind-cluster:$PATH"
```

## finish

```
# クラスタを停止
./dind-cluster-v1.15.sh stop

# コンテナやボリュームの削除
./dind-cluster-v1.15.sh clean
```

## Dashboard

http://127.0.0.1:55000/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
```
kubectl -n kube-system get secret
kubectl -n kube-system describe secret hoge
```
