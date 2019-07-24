
> ./start.sh

> kubectl get ns
...
orgname       Active    1m
...

> kubectl get all --namespace=orgname
...

> kubectl get pods --namespace=orgname
NAME                              READY     STATUS    RESTARTS   AGE
authentication-6497cbf5cf-2kch5   1/1       Running   0          9s
tomcat-584fb657dc-2wbsz           1/1       Running   0          8s
tomcat-584fb657dc-9dqz9           1/1       Running   0          8s
tomcat-584fb657dc-nr7m2           1/1       Running   0          8s

> kubectl describe pod tomcat-584fb657dc-2wbsz --namespace=orgname
...
