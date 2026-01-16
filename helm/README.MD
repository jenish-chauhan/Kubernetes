# Helm – Kubernetes Package Manager (Complete Guide)

This document explains **Helm** in depth, including:

- Why Helm exists
- Core Helm concepts
- Helm architecture
- Day-to-day Helm commands
- Helm workflow in real projects
- Interview and production notes

Helm is tightly integrated with **:contentReference[oaicite:0]{index=0}** and is a must-know tool for DevOps engineers.

---

## 1. What is Helm?

**Helm** is a **package manager for Kubernetes**.

Just like:

- `apt` → Ubuntu
- `yum` → CentOS
- `npm` → Node.js

👉 **Helm manages Kubernetes applications**.

### In simple words:

> Helm helps you **install, upgrade, configure, and manage Kubernetes applications easily**.

Without Helm, managing large YAML files becomes painful.

---

## 2. Why Helm is Needed (Real Problem)

### Without Helm:

- Hundreds of YAML files
- Repeating values (image, replicas, ports)
- No versioning
- No easy rollback
- Hard to manage environments (dev, stage, prod)

### With Helm:

- Reusable templates
- Centralized configuration
- Version control for deployments
- Easy upgrades and rollbacks
- Environment-specific values

---

## 3. What is a Helm Chart?

A **Helm Chart** is a **packaged Kubernetes application**.

### A Helm Chart contains:

- Kubernetes YAML templates
- Default configuration values
- Metadata about the application

### In simple words:

> A Helm Chart is a **blueprint of a Kubernetes application**.

---

## 4. Helm Core Components (VERY IMPORTANT)

### 1️⃣ Chart

- Package format used by Helm
- Contains templates + values

### 2️⃣ Release

- A **running instance** of a Helm chart in a cluster

### 3️⃣ Repository

- Place where Helm charts are stored
- Example: Bitnami, Artifact Hub

### Relationship:

---

## 5. Helm Architecture

Helm uses a **client-only architecture** (no server-side component).

### Components:

- **Helm CLI** → Runs on your local machine or CI/CD
- **Kubernetes API Server** → Helm talks directly to it

⚠️ Old Helm (v2) used Tiller — **modern Helm (v3) does NOT**.

---

## 6. Helm Chart Directory Structure (Must Remember)

```text
mychart/
├── Chart.yaml        # Chart metadata
├── values.yaml       # Default values
├── templates/        # Kubernetes YAML templates
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── charts/           # Dependencies (optional)
```

==========

1. Important Files Explained

- Chart.yaml

        Contains metadata:

        name: myapp
        version: 1.0.0
        appVersion: "1.0"

- values.yaml

        Contains configurable values:

        replicaCount: 2
        image:
        repository: nginx
        tag: latest
        service:
        port: 80

- templates/

  Contains Kubernetes YAML with variables:

  replicas: {{ .Values.replicaCount }}
