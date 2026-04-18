#!/usr/bin/env bash

set -e

NAMESPACE="infra-stack-lab"

echo "========================================"
echo "K8s status"
echo "Namespace: ${NAMESPACE}"
echo "========================================"

echo
echo "Deployments:"
kubectl get deployment -n "${NAMESPACE}"

echo
echo "Pods:"
kubectl get pods -n "${NAMESPACE}"

echo
echo "Services:"
kubectl get svc -n "${NAMESPACE}"

echo
echo "All resources:"
kubectl get all -n "${NAMESPACE}"