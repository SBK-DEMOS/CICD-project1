In this section, We are going to perform configuration of Continuous Integration Job with Jenkins Declarative Pipeline.  

* We will use a Java Springboot code which is at github repository [cloudfreak](https://github.com/SBK-DEMOS/cloudfreak).  
* We are configuring an Integration job in Jenkins. Job will pickup the code from Git repo maven will build the code, docker image will be created and pushed to Docker registry. Please create docker registry if one does not exists.
* Jenkins Declarative pipeline will have the below stages:
    * Clone the code files from Git repo.
    * Build will be done and Artifacts are generated.  
    * Artifacts are copied to cloudfreak/docker folder.  
    * Build docker image and push to docker hub.  
    
* Configure Maven and JDK in Global Tool Configuration: **At Jenkins UI**  
    > **Note**
    > These values should be same as defined at ~/.bash_profile file.  
    
    * Click "**Manage Jenkins**" == > Click "**Global Tool Configuration**" , Go JDK section and click "**Add JDK**", uncheck "**Install Automatically**"  
        * Give **JDK Name** and **JAVA_HOME**.  
    *(For Ex: JDK Name: JDK11 , JAVA_HOME: /usr/lib/jvm/java-11-amazon-corretto.x86_64)*  
    * Go to **Maven** section, click **Add Maven** , uncheck "**Install Automatically**"   
        * Give **Name** and **MAVEN_HOME**  
        *(For Ex: Maven Name: maven3 , MAVEN_HOME: /opt/apache-maven-3.8.7)*  

    * Click **Save**  

* Configure Docker creadentials in Jenkins  
    * Click "**Manage Jenkins**" == > Click "**Manage Crediantials**", Go to **Stored scoped to xxx** section, click **Global credentials** ==> **Add Credentials** and save Dockerhub credentials and provide **ID**  
    
## Configure Build job & Create Docker Image  

* Go to Jenkins Dashboard , Click **New Item** ==> Give a name for job under **Enter an item name** (ex: Petclinic-APP-Build1) , select **Pipeline**, Go to Pipeline section, select **Pipeline script from SCM** ==> select **Git** == > paste "Repository URL" and other applicable details( i.e, Repo password, Branch, Script (Jenkinsfile) path etc)  ==> click **Save**  ==> click **Build Now**  

* Click on Build job number under **Build History** to see console output.  

[Go to TOP](https://github.com/SBK-DEMOS/CICD-project1/tree/main/4.%20Setup%20Continuous%20Integration%20Job%20in%20Jenkins)  


