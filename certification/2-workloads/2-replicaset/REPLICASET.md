# 2.2 ReplicaSet
A [ReplicaSet (RS)](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/) is a Kubernetes object that ensures there is always a stable set of running pods for a specific workload.

it's important to notice that a RS has two important values, `current state` and `desired state`.

If a Pod goes down, the replica set will ensure to create a new pod to mantain the desired state. If there is not enouth room to create this new Pod the current state and the desired state won't match until a new node or another pod gets deleted. 

## Playground
```bash
# RUN THE EXAMPLE 1
kubectl apply -f example-replicaset-1.yaml

# TO VIEW THE REPLICASET
kubectl get pods
kubectl get replicaset

# TO VIEW REPLICA SET WORKING
kubectl get pods --show-labels
kubectl get replicaset
kubectl delete pod frontend-XXXX
kubectl get replicaset
kubectl get pods
```

> [!IMPORTANT]  
> `spec.selector.matchLabels` and `spec.template.metadata.labels` must have the 
> same value to work properly.
