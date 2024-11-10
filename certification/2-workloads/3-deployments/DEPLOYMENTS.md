# 2.3 Deployments

add diagram here

[Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) provides replication funcionality with the help of ReplicaSets, alogn with various aditional capability like rolling out of changes, rollback changes if required.

The most important concept of this object is the hability to have versions of a replicaSet and the capability of rolling out and rollback changes.

## Playground
```bash
# RUN THE EXAMPLE 1
kubectl apply -f example-deployment-1.yaml

# TO VIEW THE DEPLOYMENT AND THE REVISIONS
kubectl get deployments
kubectl get replicaset
kubectl describe deployments nginx-deployment
kubectl rollout history deployment.v1.apps/nginx-deployment

# ROLLOUT CHANGES
kubectl apply -f example-deployment-2.yaml
# Basically, this example change the nginx version of the example 1 to produce a version change
kubectl rollout history deployment.v1.apps/nginx-deployment --revision 1
kubectl rollout history deployment.v1.apps/nginx-deployment --revision 2

# ROLLBACK CHANGES
kubectl rollout undo deployment.v1.apps/nginx-deployment  --to-revion=1
kubectl get rs
kubectl describe deployments nginx-deployment
 # Check that now you have a new version, no the version 1
kubectl rollout history deployment.v1.apps/nginx-deployment
```

> [!IMPORTANT]  
> After rolling back a version, a new version is generated.

## Playground only with CLI

