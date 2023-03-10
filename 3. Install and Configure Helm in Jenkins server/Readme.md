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
You may get error like ==> Kubernetes cluster unreachable.............   Reason is the absence of kubeconfig file.  
Place $HOME/.kube/config(ex: /var/lib/jenkins/.kube/config)  and try again "helm list"  

Note: If you get any warnings like Kubernetes configuration file is group-readable/world-readable.  

Give **chmod 600 $HOME/.kube/config** and try again **"helm repo list"**  


* Once Helm is set up properly, add the repo as follows:  
```   
-bash-4.2$ chmod 600 /var/lib/jenkins/.kube/config
-bash-4.2$
-bash-4.2$ helm list
NAME    NAMESPACE       REVISION        UPDATED STATUS  CHART   APP VERSION
-bash-4.2$ helm repo list
Error: no repositories to show    
```  
Add stable repo  
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
    
```  

Ex: helm install mysqldb1 stable/mysql  

[Go to TOP](https://github.com/SBK-DEMOS/CICD-project1/tree/main/3.%20Install%20and%20Configure%20Helm%20in%20Jenkins%20server)


    






