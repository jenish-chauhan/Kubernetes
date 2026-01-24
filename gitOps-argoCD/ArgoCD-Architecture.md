# Argo CD Architecture – Complete Guide

## What is Argo CD?

Argo CD is a **declarative GitOps continuous delivery tool for Kubernetes**.  
It continuously monitors Git repositories and ensures that the **actual state of a Kubernetes cluster matches the desired state defined in Git**.

Argo CD follows a **pull-based GitOps model**, where the cluster pulls changes from Git instead of CI pipelines pushing changes.

---

## Why Argo CD is Needed

Traditional deployments:

- CI pipeline pushes manifests directly to the cluster
- High security risk (CI needs cluster access)
- No drift detection
- Rollbacks are complex

Argo CD solves this by:

- Making **Git the single source of truth**
- Automatically syncing cluster state with Git
- Detecting and correcting configuration drift
- Providing UI, CLI, and API for visibility

---

## High-Level Argo CD Architecture

::contentReference[oaicite:0]{index=0}

Argo CD consists of **multiple components**, each with a clear responsibility.

---

## Core Components of Argo CD

### 1. API Server (argocd-server)

**Purpose:**

- Entry point for users and external systems

**Responsibilities:**

- Exposes REST API and Web UI
- Authentication (SSO, LDAP, OAuth, Dex)
- Authorization (RBAC)
- Application management requests

**Used by:**

- Web UI
- CLI (`argocd` command)
- CI tools (optional)

**Important Note:**

- It does NOT apply changes directly to the cluster

---

### 2. Repository Server (argocd-repo-server)

**Purpose:**

- Fetches and processes Git repositories

**Responsibilities:**

- Clones Git repositories
- Renders manifests from:
  - Plain YAML
  - Helm charts
  - Kustomize
  - Jsonnet
- Generates Kubernetes manifests

**Key Point:**

- It only generates manifests
- It does NOT talk to Kubernetes API directly

---

### 3. Application Controller (argocd-application-controller)

**Purpose:**

- The brain of Argo CD

**Responsibilities:**

- Compares desired state (Git) with actual state (Cluster)
- Detects drift
- Syncs applications
- Applies changes to the cluster
- Handles auto-sync and self-healing

**This is the ONLY component that:**

- Talks directly to the Kubernetes API
- Applies manifests

---

### 4. Redis (Cache Layer)

**Purpose:**

- Improves performance and scalability

**Responsibilities:**

- Caches:
  - Application state
  - Manifest data
  - Repository metadata
- Reduces load on Git and Kubernetes API

**Note:**

- Argo CD can run without Redis, but it is not recommended for production

---

## Argo CD Application (Important Concept)

An **Application** in Argo CD is a **custom resource** that defines:

- Git repository URL
- Path or Helm chart
- Target cluster
- Namespace
- Sync policy

Example:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
```
