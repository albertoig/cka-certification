# 2.5 Assign pods to nodes
You can choose to [assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) for different reasons, normally kubernetes will take care of that with a good performance, but there are exceptions where nodes have different attributes that a pod can only run in that node or group of nodes.

# 2.5.1 Node selector
Like many other Kubernetes objects, nodes have labels. You can attach labels manually. Kubernetes also populates a standard set of labels on all nodes in a cluster. You can add labels to nodes plus the labels that the node already has(these labels depends on the cloud provider). 

`nodeSelector` is the simplest recommended form of node selection constraint. You can add the nodeSelector field to your Pod specification and specify the node labels you want the target node to have. Kubernetes only schedules the Pod onto nodes that have each of the labels you specify.

---
title: Node selector diagram of the example
---
flowchart TB
    subgraph node1
    end
    subgraph node2
    end
    subgraph node3
    pod
    end

> [!NOTE]  
> The example of node selector is with 3 nodes.
```bash
# LIST NODES
kubectl get nodes
# ADD LABELS TO NODES
kubectl label node <node_1> disk=hhd
kubectl label node <node_2> disk=hhd
kubectl label node <node_3> disk=ssd

# DESCRIBE TO CHECK THE LABELS
kubectl describe node <node_1>
kubectl describe node <node_3>

# DEPLOY EXAMPLE
kubectl apply -f certification/2-workloads/5-assign-pods-nodes/examples/example-nodeselector-1.yaml

# GET PODS INFORMATION
kubectl get pods -o wide

# LIST NODES
kubectl get nodes
```

# 2.5.2 Node Affinity
`nodeSelector` is the simplest way to constrain Pods to nodes with specific labels. [Affinity and anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) expands the types of constraints you can define.

Some of the benefits of affinity and anti-affinity include:
- The affinity/anti-affinity language is more expressive. `nodeSelector` only selects nodes with all the specified labels. Affinity/anti-affinity gives you more control over the selection logic.
- You can indicate that a rule is soft or preferred, so that the scheduler still schedules the Pod even if it can't find a matching node.
- You can constrain a Pod using labels on other Pods running on the node (or other topological domain), instead of just node labels, which allows you to define rules for which Pods can be co-located on a node.

The affinity feature consists of two types of affinity:
- Node affinity functions like the `nodeSelector` field but is more expressive and allows you to specify soft rules.
- Inter-pod affinity/anti-affinity allows you to constrain Pods against labels on other Pods.

Node affinity is conceptually similar to `nodeSelector`, allowing you to constrain which nodes your Pod can be scheduled on based on node labels. There are two types of node affinity:

- `requiredDuringSchedulingIgnoredDuringExecution`: The scheduler can't schedule the Pod unless the rule is met. This functions like `nodeSelector`, but with a more expressive syntax.
- `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler tries to find a node that meets the rule. If a matching node is not available, the scheduler still schedules the Pod.

You can specify node affinities using the `.spec.affinity.nodeAffinity` field in your Pod spec.

## Hard example (requiredDuringSchedulingIgnoredDuringExecution)
```bash
# LIST NODES
kubectl get nodes
# ADD LABELS TO NODES
kubectl label node <node_1> disk=hhd
kubectl label node <node_2> disk=hhd
kubectl label node <node_3> disk=ssd

# DESCRIBE TO CHECK THE LABELS
kubectl describe node <node_1>
kubectl describe node <node_3>

# DEPLOY EXAMPLE
kubectl apply -f certification/2-workloads/5-assign-pods-nodes/examples/example-nodeaffinity-hard.yaml

# GET PODS INFORMATION
kubectl get pods -o wide

# LIST NODES
kubectl get nodes

# DELETE POD
kubectl delete -f certification/2-workloads/5-assign-pods-nodes/examples/example-nodeaffinity-hard.yaml
# APPLY NOT IN EXAMPLE
kubectl apply -f certification/2-workloads/5-assign-pods-nodes/examples/example-nodeaffinity-hard-notin.yaml

# GET PODS INFORMATION
kubectl get pods -o wide

# LIST NODES
kubectl get nodes
```
> [!NOTE]  
> You can use the operator field to specify a logical operator for Kubernetes to use when interpreting the rules. You can use In, NotIn, Exists, DoesNotExist, Gt and Lt.

## Soft example (preferredDuringSchedulingIgnoredDuringExecution)
```bash
# LIST NODES
kubectl get nodes
# ADD LABELS TO NODES
kubectl label node <node_1> disk=hhd
kubectl label node <node_2> disk=hhd
kubectl label node <node_3> disk=ssd

# DESCRIBE TO CHECK THE LABELS
kubectl describe node <node_1>
kubectl describe node <node_3>

# DEPLOY EXAMPLE
kubectl apply -f certification/2-workloads/5-assign-pods-nodes/examples/example-nodeaffinity-soft.yaml

# GET PODS INFORMATION
kubectl get pods -o wide

# LIST NODES
kubectl get nodes
```