#!/bin/bash

echo "🚀 Installing NGINX Ingress Controller for KIND..."

# Create ingress-nginx namespace
kubectl create namespace ingress-nginx --dry-run=client -o yaml | kubectl apply -f -

# Apply the official ingress-nginx manifest for KIND
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "⏳ Waiting for ingress controller to be ready..."

# Wait for pod to become ready
kubectl wait --namespace ingress-nginx \
  --for=condition=Ready pod \
  -l app.kubernetes.io/component=controller \
  --timeout=180s

echo "✅ NGINX Ingress Controller installed successfully!"
