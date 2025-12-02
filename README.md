🎤 Mini-Project Explanation (You Can Speak Like This)
1. Introduction
“Hi everyone, I worked on a Kubernetes mini-project where I learned how networking works inside Kubernetes using KIND clusters.
The project covers Pods, Services, Ingress, and Network Policies.
I also deployed the Kubernetes Dashboard and used it to visualize cluster resources.”
🎤 2. What I Set Up
a) Created a Local Kubernetes Cluster using KIND
Built a multi-node cluster using a YAML config
Verified cluster with:
Installed the proper CNI so networking will work.
🎤 3. Workloads I Deployed
a) Pods
“I deployed sample web, API, and DB pods.
Each pod got its own IP using the Kubernetes CNI.”
b) Services
“I exposed the pods using:
ClusterIP for internal communication
NodePort for external access
LoadBalancer (simulated using KIND)”
🎤 4. Ingress Setup
“I configured an Ingress controller using NGINX, and created Ingress rules so that:
/web → web service
/api → api service
This taught me how Kubernetes handles routing at Layer 7.”
🎤 5. Network Policies
“This is the main part of the project.
I implemented and tested multiple network policies:
✔ deny-all.yaml
Blocks all incoming traffic to pods.
✔ allow-namespace.yaml
Allows communication only from specific namespaces.
✔ allow-web.yaml
Allows only the API pod to talk to the Web pod on port 80.
These policies helped me understand how Kubernetes security works at the network level.”
🎤 6. Kubernetes Dashboard
“I deployed the Kubernetes Dashboard in its own namespace and created an admin ServiceAccount.
Then I generated a login token and accessed the dashboard UI.
Through the dashboard I verified:
Pods
Services
Ingress
Network Policies
Events
Logs
This helped me visualize everything running inside the cluster.”
🎤 7. Key Learning Outcomes
How Kubernetes assigns IPs using CNI
Pod-to-pod, pod-to-service, and service-to-service communication
How NodePort and Ingress expose applications
Securing traffic using Network Policies
Using Dashboard to observe workloads
Difference between cluster-level and namespace-level networking
🎤 8. Final Summary
“This mini-project helped me understand complete Kubernetes networking end-to-end.
I learned how scheduling, IP allocation, routing, and access control work in a real-time environment.
It also taught me how to debug pods, services, and network flows using CLI and Dashboard.”
kubectl cluster-info
kubectl get nodes



cocnepts like

1️⃣ Pod-to-Pod Networking

Every Pod gets its own IP.

Pods can communicate directly with each other without NAT.

Kubernetes requires a flat network.

example

pod A (10.244.0.5) → pod B (10.244.0.7)


Real-time use:

Microservices talking to each other (API → backend → DB adapter).

2️⃣ Container Network Interface (CNI)

CNI is how Pods get their IPs.

Common CNIs:

Calico → enterprise networks, policies

Flannel → simple overlays

Weave → auto-discovery

Cilium → eBPF, high performance

Real-time use:

Companies choose CNIs based on security, performance, and network policies.


3️⃣ Service Networking

Pods die → IPs change
So Services provide Stable networking.

Types:

ClusterIP (default) – internal

NodePort – exposes port on node

LoadBalancer – cloud external LB

Headless service – direct Pod DNS

Real-time use:

You never expose Pods directly. Always expose through a Service.


4️⃣ kube-proxy & iptables / IPVS

Handles the routing for Services

Makes sure traffic goes to the right Pod

Real-time use:

Load balancing inside the cluster.


5️⃣ DNS in Kubernetes

Every Pod, Service gets DNS name:

Example:

backend.default.svc.cluster.local

Real-time use:

Microservices call each other using DNS names not IPs.


6️⃣ Ingress Networking

Used for HTTP/HTTPS routing.

Example:

/api → backend-service
/login → auth-service


Ingress Controllers:

NGINX

Traefik

HAProxy

Real-time use:

Used for real production routing & SSL termination.

7️⃣ Network Policies

Controls:

Which Pod can talk to which Pod

Works like a Kubernetes firewall

Real-time use:

Zero-trust security → extremely important in companies.

1) Start your Kind cluster (if not running):

kind create cluster --name k8-networking

2) Apply deployments/services:

kubectl apply -f deployments/
kubectl apply -f services/
kubectl apply -f ingress/
kubectl apply -f network-policies/

3) Check the resources:

kubectl get pods
kubectl get svc
kubectl get deployments
kubectl get ingress
kubectl get networkpolicies


4) Visualize the topology in a browser:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy
