#!/bin/bash

minikube ssh -- sudo ip link set docker0 promisc on

kubectl create namespace openwhisk
kubectl label nodes --all openwhisk-role=invoker

helm init
while [[ $(kubectl get pods -n kube-system -l name=tiller -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
  echo "waiting for pod" && sleep 1;
done

kubectl create clusterrolebinding tiller-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default


#git clone git@github.com:apache/openwhisk-deploy-kube.git

export OW_K8S_DEPLOY_HOME=$WKS_HOME/openwhisk-deploy-kube
export OW_API_HOST_NAME=$(minikube ip)
export OW_API_HOST_PORT=31001


cat <<EOF > $OW_K8S_DEPLOY_HOME/helm/openwhisk/cluster.yaml
whisk:
  ingress:
    type: NodePort
    apiHostName: $OW_API_HOST_NAME
    apiHostPort: $OW_API_HOST_PORT

invoker:
  containerFactory:
    impl: "kubernetes"

probes:
  zookeeper:
    livenessProbe:
      initialDelaySeconds: 5
      periodSeconds: 10
      timeoutSeconds: 1
    readinessProbe:
      initialDelaySeconds: 5
      periodSeconds: 10
      timeoutSeconds: 1
  controller:
    livenessProbe:
      initialDelaySeconds: 30
      periodSeconds: 15
      timeoutSeconds: 10
    readinessProbe:
      initialDelaySeconds: 15
      periodSeconds: 15
      timeoutSeconds: 10

nginx:
  httpsNodePort: $OW_API_HOST_PORT
EOF

helm template $OW_K8S_DEPLOY_HOME/helm/openwhisk/ --namespace=openwhisk --name=owdev -f $OW_K8S_DEPLOY_HOME/helm/openwhisk/cluster.yaml \
  > $OW_K8S_DEPLOY_HOME/helm/openwhisk/ow-template.yaml
kubectl -n openwhisk create -f $OW_K8S_DEPLOY_HOME/helm/openwhisk/ow-template.yaml

# kubectl set env statefulsets.apps owdev-invoker CONFIG_whisk_containerProxy_timeouts_idleContainer="1 minute" CONFIG_whisk_containerProxy_timeouts_pauseGrace="5 seconds"