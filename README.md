# Install Istio

```sh
# Create namespace istio-system
#
kubectl create namespace istio-system

# Install Istio operator
#
istioctl operator init --watchedNamespaces=istio-system

``` 

...deploy all resources in the `yaml` via CI/CD
