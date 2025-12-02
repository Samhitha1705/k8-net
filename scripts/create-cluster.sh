#!/bin/bash
kind create cluster --name net-lab --config kind/kind-cluster.yaml
kubectl cluster-info
kubectl get nodes -o wide
