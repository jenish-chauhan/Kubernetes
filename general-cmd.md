# YAML & Output Formats

kubectl get pod <pod-name> -o yaml
kubectl get deploy <deployment-name> -o yaml
kubectl get svc -o wide

# Events & Debugging

kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp

# Resource Usage (Metrics Server Required)

kubectl top node
kubectl top pod

# ConfigMaps & Secrets

kubectl get cm
kubectl create cm app-config --from-file=config.txt
kubectl get secret
kubectl describe secret <secret-name>

# Node Management Commands

kubectl get nodes
kubectl describe node <node-name>
kubectl cordon <node-name>
kubectl drain <node-name> --ignore-daemonsets

# CRD & Custom Resource Commands

kubectl get crd
kubectl describe crd <crd-name>
kubectl get <custom-resource-plural>
