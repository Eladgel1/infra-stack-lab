#!/usr/bin/env bash

set -e

NAMESPACE="infra-stack-lab"

if ! minikube status >/dev/null 2>&1; then
  echo "ERROR: Minikube is not running."
  echo "Start it first with: minikube start"
  exit 1
fi

echo "========================================"
echo "K8s setup started"
echo "Namespace: ${NAMESPACE}"
echo "========================================"

echo "[1/5] Applying namespace..."
kubectl apply -f k8s/namespace.yaml

echo "[2/5] Applying configmap..."
kubectl apply -f k8s/configmap.yaml

if [ ! -f "k8s/secret.yaml" ]; then
  echo "ERROR: k8s/secret.yaml was not found."
  echo "Create it from k8s/secret.example.yaml before continuing."
  exit 1
fi

echo "[3/5] Applying secret..."
kubectl apply -f k8s/secret.yaml

echo "[4/5] Applying deployment..."
kubectl apply -f k8s/deployment.yaml

echo "[5/5] Applying service..."
kubectl apply -f k8s/service.yaml

echo "========================================"
echo "K8s setup completed successfully"
echo "========================================"