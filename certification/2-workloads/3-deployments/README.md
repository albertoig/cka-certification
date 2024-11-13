- [2.3 Deployments](#23-deployments)
   * [Example with YAML](#example-with-yaml)
   * [Example with CLI](#example-with-cli)
   * [IMPORTANT FOR THE EXAM](#important-for-the-exam)
      + [1. How rolling update a new image for the deployment](#1-how-rolling-update-a-new-image-for-the-deployment)
      + [2. Importance of --record parameter](#2-importance-of---record-parameter)
      + [3. How to Rollback a deployment](#3-how-to-rollback-a-deployment)
      + [4. How to scale a deployment](#4-how-to-scale-a-deployment)
      + [5. Create a YAlM manifest from CLI](#5-create-a-yalm-manifest-from-cli)

# 2.3 Deployments

add diagram here

[Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) provides replication funcionality with the help of ReplicaSets, alogn with various aditional capability like rolling out of changes, rollback changes if required.

The most important concept of this object is the hability to have versions of a replicaSet and the capability of rolling out and rollback changes.

## Example with YAML
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
kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision 1
kubectl get rs
kubectl describe deployments nginx-deployment
 # Check that now you have a new version, no the version 1
kubectl rollout history deployment.v1.apps/nginx-deployment

# END THE EXAMPLE
kubectl delete -f example-deployment-2.yaml
```

> [!IMPORTANT]  
> After rolling back a version, a new version is generated.

## Example with CLI
```bash
# RUN THE EXAMPLE CLI
# CREATE DEPLOYMENT
kubectl create deployment cka-deployment --image=nginx
# CREATE DEPLOYMENT WITH 3 REPLICAS
kubectl create deployment cka-deployment-2 --image=nginx --replicas 3
kubectl get deployments
kubectl get pods

# PRINT YAML OF THE DEPLOYMENT WITHOUT EXECUTING ON THE K8S CLUSTER
kubectl create deployment cka-deployment-3  --image=nginx --dry-run=client -o yaml

# END EXAMPLE
kubectl delete deployment cka-deployment
kubectl delete deployment cka-deployment-2
```

## IMPORTANT FOR THE EXAM

### 1. How rolling update a new image for the deployment
```bash
# CREATE EXAMPLE
kubectl create deployment  nginx-deployment --image=nginx
# SET IMAGE
kubectl set image deployment nginx-deployment nginx=nginx:1.9.1 --record
# DELETE EXAMPLE
kubectl delete deployment nginx-deployment
```
### 2. Importance of --record parameter
The record parameter add the cause of the change in the rollback history.
> [!CAUTION]
> Record parameter is going to be deprecated in future versions.
```bash
# CREATE EXAMPLE
kubectl create deployment nginx-deployment --image=nginx
# SET IMAGE
kubectl set image deployment nginx-deployment nginx=nginx:1.9.1 --record
# SHOW HISTORY
kubectl rollout history deployment.v1.apps/nginx-deployment
# DELETE EXAMPLE
kubectl delete deployment nginx-deployment
```
### 3. How to Rollback a deployment
```bash
# CREATE EXAMPLE
kubectl create deployment nginx-deployment --image=nginx
# SET IMAGE
kubectl set image deployment nginx-deployment nginx=nginx:1.9.1 --record
# ROLLOUT TO PREVIOUS VERSION
kubectl rollout undo deployment.v1.apps/nginx-deployment
# SHOW HISTORY
kubectl rollout history deployment.v1.apps/nginx-deployment
# ROLLOUT TO VERSION 1
kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision 2
# DELETE EXAMPLE
kubectl delete deployment nginx-deployment
```
> [!IMPORTANT]  
> After rolling back a version, a new version is generated.
### 4. How to scale a deployment
```bash
# CREATE EXAMPLE
kubectl create deployment nginx-deployment --image=nginx
# SCALE
kubectl scale deployment nginx-deployment --replicas 8
# SHOW THE NUMBER OF PODS
kubectl get pods
# DELETE EXAMPLE
kubectl delete deployment nginx-deployment
```
### 5. Create a YAlM manifest from CLI
```bash
kubectl create deployment cka-deployment-4 --image=nginx --dry-run=client -o yaml
```
