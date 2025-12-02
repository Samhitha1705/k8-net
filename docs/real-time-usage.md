# Real-Time Usage of Kubernetes Networking

## 1️⃣ Microservices Architecture
Real companies deploy:
- A **frontend** service
- Multiple **backend** APIs
- Each with Deployments + Services + Ingress

Traffic flow example:
Browser → Ingress → Service → Pod → DB

## 2️⃣ Production Routing
Ingress controllers:
- Handle SSL/TLS offloading
- Forward traffic to correct backend
- Apply rate limits, header rewrites

## 3️⃣ Internal Service Communication
- APIs call other APIs via ClusterIP
- Example:
