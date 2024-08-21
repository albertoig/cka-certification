
::: mermaid
---
Title: How to communicate with the cluster
---
flowchart LR;
    A[API]-->B[Kubernetes Master];
    CLI-->B;
    GUI-->B;
    B-->E[WORKER NODE 1];
    B-->F[WORKER NODE 2];
    B-->G[WORKER NODE 3];
:::
