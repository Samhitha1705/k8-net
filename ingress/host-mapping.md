# Host Mapping for Kubernetes Ingress (KIND Cluster)

This file explains how to map custom hostnames to `localhost` so that the Ingress controller can route traffic correctly in a KIND Kubernetes cluster.

---

## 1️⃣ Why Host Mapping Is Needed?

Ingress rules often require hostnames such as:

