# Install Istio

```sh
# Create namespace istio-system
#
kubectl create namespace istio-system

# Install Istio operator
#
istioctl operator init --watchedNamespaces=istio-system

``` 

# Install Cert-Manager

```sh
CERT_MANAGER_VERSION=v1.8.0

kubectl create namespace cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/$CERT_MANAGER_VERSION/cert-manager.yaml  


```