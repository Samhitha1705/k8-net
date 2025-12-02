# Kubernetes Networking – Commands Cheatsheet

## 🔹 Cluster
```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc -A
kubectl get ingress -A


PODS

kubectl apply -f pods/
kubectl get pods
kubectl describe pod <name>
kubectl logs <pod>
kubectl exec -it <pod> -- bash


Deployments


kubectl apply -f deployments/
kubectl get deployments
kubectl scale deployment <name> --replicas=5

Services

kubectl apply -f services/
kubectl get svc
kubectl describe svc <name>


Ingress

kubectl apply -f ingress/
kubectl get ingress

Network Policies

kubectl apply -f network-policies/
kubectl get networkpolicy

General Debugging

kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe <resource> <name>
kubectl get endpoints
