# Kubernetes Networking – Core Concepts

This document explains the main networking concepts you must understand for both KIND practice and real-time Kubernetes environments.

---

## 1️⃣ Pod Networking
- Every **Pod gets its own IP address**.
- Pods in the same cluster can communicate directly.
- Pod-to-pod networking is handled by a **CNI plugin** (Calico, Flannel, Cilium).
- No NAT inside the cluster — communication is **flat and routable**.

---

## 2️⃣ Service Networking
Services expose Pods in a stable way using labels.

### Types of Services:
- **ClusterIP**  
  Default; internal-only communication.
- **NodePort**  
  Exposes a port (30000–32767) on every node → accessible via `localhost:<port>` in KIND.
- **LoadBalancer**  
  Cloud-based external load balancer (not used in KIND).
- **Headless Service**  
  No cluster IP; used for StatefulSets and direct pod discovery.

### Why Services?
Pods die and restart → IP changes  
Service keeps a permanent endpoint.

---

## 3️⃣ DNS in Kubernetes
- DNS is provided by **CoreDNS**.
- Every Service gets a DNS name:

Example:  
`api-service.default.svc.cluster.local`

This enables microservices to communicate reliably.

---

## 4️⃣ Ingress
Ingress exposes HTTP/HTTPS to outside world.

### Features:
- Host-based routing (`demo.local`)
- Path-based routing (`/api`)
- TLS/SSL termination
- Load balancing

Requires an **Ingress Controller**, like:
- NGINX Ingress Controller  
- Traefik

In KIND, NGINX Ingress is used with port 80/443 mapped to localhost.

---

## 5️⃣ Network Policies
Network Policies **control traffic** between Pods.

You can:
- Deny all traffic
- Allow only specific Pods
- Allow only specific Namespaces

Works like a firewall inside Kubernetes.

---

## 6️⃣ KIND Networking
KIND uses Docker containers to simulate Kubernetes nodes.

Key points:
- NodePort → accessible via localhost  
Example: `http://localhost:30001`
- Ingress → works via host port mapping  
- Pods still get real pod IPs inside KIND
- DNS and Services work normally

This allows full networking testing without cloud resources.

---

## 7️⃣ Real-Time Application Flow
Example traffic flow:


Frontend to backend communication uses:


Network Policies secure the communication:
- Allow frontend → backend
- Block unknown pods → backend

---

## Summary
You learn and practice:
- Pod IPs and connectivity  
- Services (ClusterIP / NodePort)  
- DNS resolution  
- Ingress routing  
- Network Policies  
- Real traffic flow like real microservices  

These are the same concepts used in **real production Kubernetes environments**.
