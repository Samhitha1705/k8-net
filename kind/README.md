# KIND Cluster Setup for Kubernetes Networking Project

This folder contains files to help create a multi-node KIND cluster and install an Ingress Controller.

---

## 📌 Files
- **kind-cluster.yaml**  
  Multi-node KIND cluster with NodePort mappings.

- **install-ingress.sh**  
  Script to install the NGINX Ingress Controller specifically for KIND.

- **README.md**  
  Documentation for setting up the cluster.

---

## 🚀 Steps to Create the Cluster

### 1️⃣ Create the KIND cluster
```bash
kind create cluster --config kind-cluster.yaml
