#!/bin/bash

# Create codecov.yml in the git base dir
# Sample is here https://docs.codecov.io/docs/deploying-with-docker
# curl -fsSL https://raw.githubusercontent.com/codecov/enterprise/v4/compose-assets/codecov.yml > codecov.yml

# Create that as a config map
kubectl delete configmap codecov-config
kubectl create configmap codecov-config --from-file ../codecov.yml

#Deploy codecov
kubectl delete deployments web
kubectl delete deployments worker
kubectl apply -f codecovdeployment.yml

#Deploy ingress
kubectl apply -f codecovingress.yml