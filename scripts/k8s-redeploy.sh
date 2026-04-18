#!/usr/bin/env bash

set -e

NAMESPACE="infra-stack-lab"
DEPLOYMENT_NAME="infra-stack-lab-api"
IMAGE_NAME="infra-stack-lab:prod"

echo "========================================"
echo "K8s redeploy started"
echo "Namespace: ${NAMESPACE}"
echo "Deployment: ${DEPLOYMENT_NAME}"
echo "Image: ${IMAGE_NAME}"
echo "========================================"

echo "[1/4] Connecting current shell to Minikube Docker daemon..."
eval "$(minikube -p minikube docker-env --shell bash)"

echo "[2/4] Building production image inside Minikube..."
docker build -t "${IMAGE_NAME}" .

echo "[3/4] Restarting deployment rollout..."
kubectl rollout restart deployment/"${DEPLOYMENT_NAME}" -n "${NAMESPACE}"

echo "[4/4] Waiting for rollout to complete..."
kubectl rollout status deployment/"${DEPLOYMENT_NAME}" -n "${NAMESPACE}"

echo "========================================"
echo "K8s redeploy completed successfully"
echo "========================================"