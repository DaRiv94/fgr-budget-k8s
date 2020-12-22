helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install cert-manager  --namespace ingress-nginx --version v0.16.1 --set installCRDs=true --set nodeSelector."beta\.kubernetes\.io/os"=linux jetstack/cert-manager