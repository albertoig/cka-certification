# 2.4 DaemonSet
A [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) is a Kubernetes object that ensures that a pod is available on every worker node in a cluster. Some typical uses of a DaemonSet are:
- running a cluster storage daemon on every node
- running a logs collection daemon on every node
- running a node monitoring daemon on every node
```bash
# CREATE DAEMONSET FROM EXAMPLE 1
kubectl apply -f certification/2-workloads/4-daemonsets/example-daemonset-1.yaml
# GET DAEMON SETS
kubectl get ds
# CHECK IN WHERE PODS ARE RUNNING
kubectl get pods -o wide
# DELETE EXAMPLE
kubectl delete -f certification/2-workloads/4-daemonsets/example-daemonset-1.yaml
```