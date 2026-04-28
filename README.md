# aws-eks-devops-pipeline-myProject

☁️ AWS Infrastructure Provisioned using Terraform
This Terraform code provisions:


VPC


Public / Private Subnets


Internet Gateway


Route Tables


Security Groups


IAM Roles


EKS Cluster


Managed Node Group


Terraform EKS modules commonly support managed node groups, IAM, cluster endpoint, and networking resources. 

🔧 Prerequisites
Before starting, install:


AWS CLI


Terraform


kubectl


Docker


Java 17 / 21


Maven


Jenkins


Verify installation:
aws --versionterraform -versionkubectl version --clientdocker --versionjava -versionmvn -version

🔐 AWS CLI Configuration
Configure AWS credentials:
aws configure
Provide:


AWS Access Key


AWS Secret Key


Region (example: ap-south-1)


Output format (json)



🌍 Step 1: Clone Repository
git clone https://github.com/gauri17-pro/terraform-jenkins-eks.gitcd terraform-jenkins-eks

🏗️ Step 2: Deploy Infrastructure using Terraform
Move to Terraform folder:
cd terraform
Initialize Terraform:
terraform init
Validate code:
terraform validate
Preview resources:
terraform plan
Create infrastructure:
terraform apply -auto-approve
This may take 15–20 minutes depending on EKS creation time.

📤 Step 3: Configure kubectl for EKS Cluster
After successful apply:
aws eks update-kubeconfig --region ap-south-1 --name <cluster-name>
Check nodes:
kubectl get nodes
Expected output:
2 Ready nodes

🖥️ Step 4: Setup Jenkins Server
Launch EC2 instance:


Ubuntu 22.04


t2.medium recommended


20GB storage


SSH into server:
ssh -i key.pem ubuntu@public-ip
Install Java:
sudo apt updatesudo apt install openjdk-21-jdk -y
Install Jenkins:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \/usr/share/keyrings/jenkins-keyring.asc > /dev/nullecho deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \https://pkg.jenkins.io/debian-stable binary/ | sudo tee \/etc/apt/sources.list.d/jenkins.list > /dev/nullsudo apt updatesudo apt install jenkins -ysudo systemctl start jenkinssudo systemctl enable jenkins
Install Docker:
sudo apt install docker.io -ysudo usermod -aG docker jenkinssudo systemctl restart jenkins
Install Maven:
sudo apt install maven -y

🌐 Step 5: Access Jenkins
Open browser:
http://<jenkins-public-ip>:8080
Get admin password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Install suggested plugins.

🔌 Step 6: Jenkins Required Plugins
Install:


Git Plugin


Pipeline Plugin


Docker Pipeline


Kubernetes CLI Plugin


Credentials Binding Plugin



🔑 Step 7: Add Jenkins Credentials
Go to:
Manage Jenkins → Credentials
Add:
DockerHub Credentials


Username


Password


AWS Credentials


Access Key


Secret Key



⚙️ Step 8: Configure Jenkins Tools
Manage Jenkins → Global Tool Configuration
Add:


JDK


Maven


Git



📄 Step 9: Jenkins Pipeline (Jenkinsfile)
pipeline { agent any tools {   maven 'Maven'   jdk 'JDK21' } stages {   stage('Checkout') {     steps {       git 'https://github.com/yourrepo.git'     }   }   stage('Build') {     steps {       sh 'mvn clean package'     }   }   stage('Docker Build') {     steps {       sh 'docker build -t username/app:v1 .'     }   }   stage('Docker Push') {     steps {       sh 'docker push username/app:v1'     }   }   stage('Deploy to EKS') {     steps {       sh 'kubectl apply -f k8s/deployment.yaml'       sh 'kubectl apply -f k8s/service.yaml'     }   } }}
Some teams separate infrastructure and application deployment into different repos/pipelines or use GitOps pull-based deployment models. 

☸️ Step 10: Kubernetes Deployment File
deployment.yaml
apiVersion: apps/v1kind: Deploymentmetadata:  name: java-appspec:  replicas: 2  selector:    matchLabels:      app: java-app  template:    metadata:      labels:        app: java-app    spec:      containers:      - name: java-app        image: username/app:v1        ports:        - containerPort: 8080

🌐 Step 11: Kubernetes Service File
service.yaml
apiVersion: v1kind: Servicemetadata:  name: java-servicespec:  type: LoadBalancer  selector:    app: java-app  ports:  - port: 80    targetPort: 8080

🚀 Step 12: Deploy Application
kubectl apply -f k8s/deployment.yamlkubectl apply -f k8s/service.yaml
Check resources:
kubectl get podskubectl get svckubectl get deployments

🌍 Step 13: Access Application
Get external LoadBalancer URL:
kubectl get svc
Open browser:
http://EXTERNAL-IP

📊 Expected Output


Jenkins Build Success


Docker Image Created


Docker Image Pushed


Pods Running


LoadBalancer Created


Application Accessible



🔄 Rollback Deployment
kubectl rollout undo deployment java-app

📈 Scale Application
kubectl scale deployment java-app --replicas=5

🧹 Destroy Infrastructure
cd terraformterraform destroy -auto-approve

💼 Resume Points


Provisioned AWS EKS cluster using Terraform with reusable Infrastructure as Code.


Built CI/CD pipeline using Jenkins for automated build, Dockerization, and Kubernetes deployment.


Deployed containerized Java application on Amazon EKS.


Configured Kubernetes LoadBalancer service for external traffic.


Managed scalable and automated deployments using DevOps best practices.



🔥 Future Enhancements


Terraform Remote Backend (S3 + DynamoDB)


Prometheus Monitoring


Grafana Dashboard


ArgoCD GitOps Deployment


SonarQube Code Analysis


Helm Charts


Blue/Green Deployment



👨‍💻 Author
Shaily Agarwal



