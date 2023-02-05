This section covers deployment of APP on a Kubernetes (EKS) cluster using Jenkins pipeline.  
Required files(helm and Jenkins) are saved at Git Repo [petclinic](https://github.com/SBK-DEMOS/petclinic) 

## Configure and Trigger Deployment job from Jenkins 
* Go to Jenkins UI ==> click **New Item** , Enter the job name (ex: Petclinic-deployment1) ==> click **Pipeline** ==> Go to Pipeline section, Select **Pipeline script from SCM**, select **Git** == > paste "Repository URL" and other applicable details( i.e, Repo password, Branch, Script (Jenkinsfile) path etc) ==> click **Save** ==> click **Build Now**  

* Click on Job number under **Build History section** to see console output.  

* After successful Job run, APP at Kubernetes cluster to be running.  
Note: You can check helm list or kubectl get pods 





