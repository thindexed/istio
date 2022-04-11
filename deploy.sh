# Settings in .env have prio
if [ -f ./configuration/settings.ini ]; then
  set -o allexport
  source ./configuration/settings.ini
  set +o allexport
fi


echo "Using Domain: $DOMAIN"
echo "============================="

cat ./yaml/issuer.yaml | sed "s~<DOMAIN>~$DOMAIN~g" | kubectl apply -f -
cat ./yaml/domain-certificate.yaml | sed "s~<DOMAIN>~$DOMAIN~g" | kubectl apply -f -

cat ./yaml/istio-setup.yaml | sed "s~<DOMAIN>~$DOMAIN~g" | istioctl install -y -f -
cat ./yaml/istio-gateway.yaml | sed "s~<DOMAIN>~$DOMAIN~g" | kubectl apply -f -

kubectl label namespace default istio-injection=enabled --overwrite
