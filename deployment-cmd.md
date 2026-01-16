kubectl get deploy
kubectl describe deploy <deployment-name>
kubectl create deploy nginx --image=nginx
kubectl scale deploy <deployment-name> --replicas=3
kubectl rollout status deploy <deployment-name>
kubectl rollout undo deploy <deployment-name>
