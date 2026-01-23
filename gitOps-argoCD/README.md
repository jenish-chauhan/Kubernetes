Why GitOps was introduced (the real problem)

Before GitOps, DevOps teams faced these issues:

1. Manual changes everywhere

Someone runs kubectl apply
Someone edits config on the server
Someone hot-fixes in production

Result:

No one knows who changed what
Environment drift happens (dev ≠ prod)

2. No clear audit trail

If prod breaks → “Who changed it?”
No exact history of infra changes
Rollback is painful

3. CI/CD pipelines became risky

Traditional flow:
CI pipeline → directly deploys to cluster

Problems:
Pipeline needs high permissions (security risk)
If pipeline fails halfway → broken state
Hard to know actual cluster state

=================================================================

GitOps solves all of this

GitOps flips the model.

Traditional model
Human / CI ---> Kubernetes

GitOps model
Human ---> Git <--- GitOps Tool <--- Kubernetes

Now nothing changes unless Git changes.
Everything is automated from Git.
No manual changes allowed.

===========================================================

How GitOps actually works (step by step)

You write YAML (Deployment, Service, Helm, etc.)
You push it to Git
GitOps tool detects change
Tool compares:
---Git state (desired)
---Cluster state (actual)
Tool applies required changes automatically
Cluster becomes exactly like Git

============================================================

What happens if someone changes cluster manually?

Example:

kubectl edit deployment

GitOps tool sees:
--Cluster ≠ Git

Then it will:
Revert the cluster back to Git state
OR mark it as drift (based on config)

This is called drift detection and correction.
