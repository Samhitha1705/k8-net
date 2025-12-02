#!/bin/bash
echo "Testing DNS..."
kubectl run test --rm -it --image=busybox -- nslookup web-clusterip

echo "Testing service..."
kubectl run test --rm -it --image=busybox -- wget -qO- http://web-clusterip
