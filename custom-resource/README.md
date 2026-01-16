# Kubernetes Custom Resources – CRD, CR, and Custom Controller

This document explains **Custom Resource Definitions (CRDs)**, **Custom Resources (CRs)**, and **Custom Controllers** in Kubernetes in a clear and practical way.

---

## 1. What is a CRD (Custom Resource Definition)?

A **CRD** is a **schema + validation definition** that tells Kubernetes:

- What a **new resource type** looks like
- What fields it should have
- How those fields should be validated

### In simple words:

> **CRD is like a blueprint or format that validates your custom resource.**

### Example:

If Kubernetes has built-in resources like:

- Pod
- Deployment
- Service

Then a CRD allows you to create your **own resource type**, such as:

- `Database`
- `Backup`
- `Application`

### Key Points:

- CRD extends the Kubernetes API
- Written in YAML
- Defines:
  - API version
  - Kind
  - Spec schema
  - Validation rules

### Without CRD:

Kubernetes **will not recognize** your custom resource.

---

## 2. What is a CR (Custom Resource)?

A **CR** is an **actual object** created using the format defined by the CRD.

### In simple words:

> **CR is what you actually create using the CRD format.**

### Example:

- CRD defines a resource type called `Database`
- CR is an instance like `my-database`

### Key Points:

- CR follows the schema defined in CRD
- Stored in etcd like other Kubernetes objects
- Created using `kubectl apply -f`

### Relation:

- **CRD = rulebook**
- **CR = real object created using that rulebook**

---

## 3. What is a Custom Controller?

A **Custom Controller** is a program that:

- Watches Custom Resources (CRs)
- Takes actions to make the **actual cluster state match the desired state**

### In simple words:

> **Custom Controller watches CRs and performs real work based on them.**

### Example:

If a CR says:

```yaml
replicas: 3
```
