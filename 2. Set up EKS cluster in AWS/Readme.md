This section describe the steps for Kubernetes(EKS) setup  

1. You can launch a new EC2 server to manage EKS.(I am using same Jenkins server)  

2. Install latest kubectl  
   [Kubectl Binary Link](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)  
 
```  
    curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.9/2023-01-11/bin/linux/amd64/kubectl  
    chmod +x ./kubectl  
    mv kubectl /usr/local/bin  
```

check kubectl version:  
```
    kubectl version --short --client  
```  

3. Make sure AWS CLI is latest. If not, update it.  
```  
    aws --version
```

[AWS CLI Link](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  

```    
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"  
    unzip awscliv2.zip  
    sudo ./aws/install  
```  
    
4. Install EKSCTL(EKSCTL is used for creating and managing Kubernetes clusters on Amazon EKS.)
	[EKSCTL Link.] (https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)  
  
 ```  
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp  
    sudo mv /tmp/eksctl /usr/local/bin  
    eksctl version  
 ```  
5. Create and Attach IAM role for EKS management Host.  
   Reason: By default AWS services can't access each other. So, We create & attach IAM role for EKS management host.  
IAM user should have access to  
IAM  
EC2  
VPC  
CloudFormation  

   Go to AWS Dashboard ==> Services ==> IAM ==> Roles ==> Create New Role ==> Select EC2, select policies(IAMFullAccess, VPCfullaccess, EC2fullaccess, Cloudformation, AdministratorAccess) ==> Give a Name to Role (ex: EksaccesstoEC2)  ==> Create Role.  
Select EC2(EKS management host) Instance, Actions ==> Security, Modify IAM role, select role (EksaccesstoEC2) and click Save.  
Similarly, Attach the above role to Jenkins EC2 server as well(If Jenkins is installed in a seperate server).  


**Warning:**    
Use only minimal required policies In Production.   

6. Create EKS Kubernetes cluster  

```  
    eksctl create cluster --name cluster-name  \  
    --region region-name \  
    --node-type instance-type \  
    --nodes-min 2 \  
    --nodes-max 2 \  
    --zones <AZ-1>,<AZ-2>  

example:
    eksctl create cluster --name SBK-K8Scluster1 \  
    --region eu-central-1 \  
    --node-type t2.medium \  
```  
Note: Create EKS cluster in the same region of EKS management host. It may take approx 15mins time to create K8S cluster.  
      Take kubeconfig file(shown at end of K8S cluster creation) as it will be used to access the K8S cluster. 

7. To delete the EKS clsuter  
```  
    eksctl delete cluster SBK-K8Scluster1 --region eu-central-1  
```  

8. Validate your cluster using by creating by checking nodes and by creating a sample pod  
```  
    kubectl get nodes  
    kubectl run pod tomcat --image=tomcat    
```  

9. Create a Dockerhub account.(If already exists, use it.)  
   After build job, We need to push docker images to Dockerhub. Create new account if you dont have.  
   [https://hub.docker.com](https://hub.docker.com)  
   
   Note: We can also use AWS ECR or Azure ContainerRegistry or other registeries.  
   
   


   
   
   



