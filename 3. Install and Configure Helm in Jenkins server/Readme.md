This section covers Installation & Configuration of Helm in Jenkins.  
Helm manages Kubernetes applications.  

* ssh to server where Jenkins is installed and Download Helm.  
```  
    sudo su - jenkins
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3  
    chmod 700 get_helm.sh  
    ./get_helm.sh  
```  

* Test with helm command  
```  
    helm version  
    helm list  
```  
You may get error like ==> Kubernetes cluster unreachable.............   Reason is the absence of kubeconfig file. Place $HOME/.kube/config and try again "helm list"  

* Once Helm is set up properly, add the repo as follows:  
```   
    helm repo list  
```  

Note: If you get any warnings like Kubernetes configuration file is group-readable/world-readable.  

Give **chmod 600 $HOME/.kube/config** and try again **"helm repo list"**  

```  
    helm repo add stable https://charts.helm.sh/stable
```  
You can then run **helm search repo stable** to see the charts. Refer to [Helm docs](https://helm.sh/docs/helm) for any other info.  

Here are few basic commands:  
    
    helm search repo <chartname>
    helm search repo mysql  

    helm install repo stable/<chartname> <releasename>
  
    helm pull stable/<chartname>
  
    helm package <chartname>

    helm uninstall RELEASE_NAME  

* Deploy sample application on EKS Kubernetes cluster using Helm.  (Test Deployment)

```  
    helm install repo stable/<chartname> <releasename>  
    






