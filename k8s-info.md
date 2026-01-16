# Kubernetes – Complete Daily-Use README (All-in-One)

This document is a **single reference file** for working with **:contentReference[oaicite:0]{index=0}** in day-to-day DevOps tasks.
It covers:

- Core Kubernetes concepts
- CRD / CR / Custom Controller
- Frequently used kubectl commands
- Debugging & troubleshooting workflow

---

## 1. Core Kubernetes Concepts (Quick Recall)

### Pod

- Smallest deployable unit
- One or more containers
- Ephemeral (can die anytime)

### Deployment

- Manages Pods
- Handles scaling, rolling updates, rollbacks

### Service

- Exposes Pods
- Provides stable networking
- Types: ClusterIP, NodePort, LoadBalancer

### Namespace

- Logical isolation inside a cluster

---

## 2. CRD, CR, and Custom Controller (Must Remember)

### CRD (Custom Resource Definition)

- Defines **schema + validation**
- Extends Kubernetes API
- Tells Kubernetes how a new resource should look

> CRD = format / blueprint / validation rules

---

### CR (Custom Resource)

- Actual object created using CRD
- Stores desired state

> CR = what you want to create

---

### Custom Controller

- Watches CRs
- Reconciles desired state with actual state
- Creates / updates / deletes Kubernetes resources

> Controller = makes things happen

---

### Relationship
