GKE Full-Stack Deployment: React + Flask + PostgreSQL

This repository demonstrates deploying a full-stack application on Google Kubernetes Engine (GKE). The stack consists of:

Frontend: React app

Backend: Flask API

Database: PostgreSQL

It covers building Docker images, deploying to Kubernetes, connecting services, and verifying the setup.

Table of Contents

Prerequisites

Architecture Overview

Setup Steps

Kubernetes Deployment

Testing & Verification

Troubleshooting

References

Prerequisites

GCP account with permissions for GKE and Container Registry

kubectl configured to connect to your GKE cluster

Docker installed locally

Basic knowledge of React, Flask, PostgreSQL, and Kubernetes


Architecture Overview

+-----------------+       +-----------------+       +-----------------+
|   React Frontend | --->  |  Flask Backend  | --->  | PostgreSQL DB  |
+-----------------+       +-----------------+       +-----------------+
          |                         |                       |
          | Kubernetes Service       | ClusterIP / Env Vars  |
          v                         v                       v
   frontend-service          backend-service         postgres Service


Frontend communicates with Backend using the environment variable REACT_APP_API_URL.

Backend connects to PostgreSQL using environment variables: DB_HOST, DB_NAME, DB_USER, DB_PASS.

Setup Steps

1. PostgreSQL Deployment

postgres.yaml

kubectl apply -f postgres.yaml
kubectl get pods -w


2. Backend Deployment (Flask)

app.py

backend-deployment.yaml

Build & Push Docker image:

docker build -t gcr.io/veda-473706/backend:v1 .
docker push gcr.io/veda-473706/backend:v1

Apply

kubectl apply -f backend-deployment.yaml
kubectl get pods -w

3. Frontend Deployment (React)

frontend-deployment.yaml

Build & Push Docker image:

docker build -t gcr.io/veda-473706/frontend:v1 .
docker push gcr.io/veda-473706/frontend:v1

Apply

kubectl apply -f frontend-deployment.yaml
kubectl get svc frontend-service

Note: Wait until EXTERNAL-IP is assigned for the frontend service. Then you can access your React app via that IP.

4. Testing & Verification

Backend API

kubectl port-forward service/backend-service 5000:5000
curl http://localhost:5000/api
curl http://localhost:5000/db

Frontend

kubectl get svc frontend-service
# Access via EXTERNAL-IP in browser: http://<EXTERNAL-IP>
From another pod (internal cluster check):

kubectl run debug --rm -it --image=alpine -- sh
wget -qO- http://backend-service:5000/api
wget -qO- http://frontend-service

Check pod logs:

kubectl logs deployment/backend
kubectl logs deployment/frontend
kubectl logs statefulset/postgres

Troubleshooting

404 on / → Flask backend does not serve frontend; access frontend via React service.

Internal server error → check DB credentials, service names, and connectivity.

EXTERNAL-IP <pending> → wait a few minutes; LoadBalancer is provisioning in GCP.
