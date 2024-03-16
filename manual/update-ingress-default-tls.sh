#!/bin/bash
set -eu
if [[ "$#" != 1 ]]; then
  echo "Usage: $0 <your.domain.com>"
  echo "Example: $0 foo.example.com"
  exit
fi
domain=$1

# cat config/live/pgadmin1.uvoo.io/fullchain.pem  config/live/pgadmin1.uvoo.io/privkey.pem
# cat config/live/$domain/fullchain.pem  config/live/$domain/privkey.pem > haproxy/$domain.pem
# /etc/letsencrypt/live/pb.uvoo.io/fullchain.pem
# cat config/live/$domain/fullchain.pem  config/live/$domain/privkey.pem > haproxy/$domain.pem

kubectl -n ingress-nginx delete secret default-tls-certificate
kubectl -n ingress-nginx create secret tls default-tls-certificate \
  --cert="config/live/$domain/fullchain.pem" \
  --key="config/live/$domain/privkey.pem"

exit
cp config/live/$domain/fullchain.pem uvoo.io.crt
cp config/live/$domain/privkey.pem uvoo.io.key

kubectl -n ingress-nginx delete secret default-tls-certificate
kubectl -n ingress-nginx create secret tls default-tls-certificate \
  --cert="uvoo.io.crt" \
  --key="uvoo.io.key"
#tls.crt
