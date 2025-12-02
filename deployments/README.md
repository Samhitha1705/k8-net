# Deployments – Kubernetes Networking Project

This folder contains Deployment manifests used to run applications in the cluster.  
Each deployment creates Pods, maintains replicas, and exposes labels used by Services and Ingress.

---

## 📁 Files in This Folder

### 1. **api-deployment.yaml**
A backend API Deployment.
- Runs a simple API container (Python/Go/Node example)
- 2 replicas
- Label: `app: api`
- Used by: `api-service.yaml` (ClusterIP)

### 2. **web-deployment.yaml**
A frontend web Deployment.
- Runs an NGINX web server serving static content
- 2 replicas
- Label: `app: web`
- Used by: `web-service.yaml` (NodePort / ClusterIP)
- Also used by Ingress to route `/`

---

## 🚀 Apply All Deployments

```bash
kubectl apply -f deployments/
