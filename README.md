## Terraform + Jenkins + Amazon EKS CI/CD Deployment Project

This project demonstrates a complete DevOps infrastructure automation and CI/CD pipeline setup using Terraform, Jenkins, Amazon EKS, and Kubernetes.

It provisions infrastructure on AWS using Terraform, deploys Jenkins on EC2 for CI/CD automation, creates an Amazon EKS cluster for container orchestration, and deploys an NGINX application using Kubernetes manifests.


## Project Overview

This solution includes:

Infrastructure provisioning using Terraform
Remote Terraform backend using AWS S3
Separate VPC for Jenkins and EKS
Jenkins installation on EC2 using bootstrap script
Amazon EKS cluster deployment
Kubernetes application deployment
LoadBalancer service exposure


## Architecture
Developer → GitHub Repository → Jenkins Pipeline → Terraform Apply → AWS Infrastructure

## AWS Infrastructure:
├── S3 Bucket (Terraform State)
├── Jenkins VPC
│   ├── Public Subnet
│   ├── EC2 Instance
│   └── Security Group
└── EKS VPC
    ├── Public Subnets
    ├── Private Subnets
    ├── EKS Control Plane
    ├── Worker Nodes
    └── Kubernetes Application
  
## Technologies Used:
| Tool       | Purpose                 |
| ---------- | ----------------------- |
| Terraform  | Infrastructure as Code  |
| AWS        | Cloud Provider          |
| Jenkins    | CI/CD Automation        |
| Amazon EKS | Kubernetes Cluster      |
| kubectl    | Kubernetes Management   |
| GitHub     | Source Code Repository  |
| Docker     | Containerization        |
| Kubernetes | Container Orchestration |

## Project Structure:
project-root/
|
├── Jenkins/
│   ├── backend.tf
│   ├── provider.tf
│   ├── data.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── main.tf
│   └── jenkins-install.sh
│
├── EKS/
│   ├── backend.tf
│   ├── provider.tf
│   ├── data.tf
│   ├── variables.tf
│   └── terraform.tfvars
│
├── kubernetes/
│   ├── deployment.yaml
│   └── service.yaml
│
└── README.md

## Jenkins Environment
Dedicated VPC: 10.0.0.0/16
Public Subnet: 10.0.1.0/24
EC2 Instance: t2.medium
Jenkins Port: 8080
SSH Port: 22

## EKS Environment
Dedicated VPC: 192.168.0.0/16
3 Private Subnets
3 Public Subnets
Highly Available Multi-AZ Design

## Terraform Remote Backend

Terraform state files are stored securely in AWS S3.

`bucket = "aws-eks-terraform-pipeline"
key    = "jenkins/terraform.tfstate"
key    = "eks/terraform.tfstate"
region = "us-east-1" `

Benefits:

Shared team access
Remote state locking support
Versioning support
Safe collaboration

## Jenkins Auto Installation

Java 21
Jenkins
Git
Terraform
kubectl

## CI/CD Workflow:

Code Push to GitHub
        ↓
Jenkins Trigger
        ↓
Build / Test
        ↓
Terraform Apply
        ↓
EKS Deployment
        ↓
kubectl Apply
        ↓
Application Live

## Key Features:

Fully automated infrastructure provisioning
Production-style network separation
CI/CD ready Jenkins server
Kubernetes scalable deployment
Public LoadBalancer exposure
Reusable Terraform modules


### 1. Project Folder Structure
<img width="297" height="698" alt="image" src="https://github.com/user-attachments/assets/fb1afd5b-48ce-4d14-8e46-8435ea7f5806" />

### 2. Terraform Apply Success (Jenkins Infra)
<img width="452" height="473" alt="image" src="https://github.com/user-attachments/assets/236f6412-9bfb-46b2-8ea6-f9d2e2ec33ea" />

### 3. AWS Console – Jenkins EC2 Running
<img width="452" height="220" alt="image" src="https://github.com/user-attachments/assets/ac2891af-271c-4486-b201-7d8ee3ba4dec" />

### 4. Jenkins Login Page
<img width="452" height="279" alt="image" src="https://github.com/user-attachments/assets/fe6c7ace-166b-4279-8478-ecc62693b55f" />

### 5. Jenkins Dashboard
<img width="452" height="144" alt="image" src="https://github.com/user-attachments/assets/62577c4f-5d51-4611-b41d-2188e44df8a1" />

### 6. Jenkins Build Success
<img width="452" height="194" alt="image" src="https://github.com/user-attachments/assets/6337abd1-2035-45d4-ad4d-5f4fa56e3c8a" />

### 7. AWS Console – VPC Created
#### jenkins-vpc
<img width="452" height="226" alt="image" src="https://github.com/user-attachments/assets/02b16c52-8ecb-42dc-b174-20d3ede952f3" />

#### eks-vpc
<img width="452" height="224" alt="image" src="https://github.com/user-attachments/assets/adcb5cba-5a00-4c51-bef8-9814beea7065" />

### 8. AWS Console – EKS Cluster Active
<img width="452" height="213" alt="image" src="https://github.com/user-attachments/assets/e7fa936c-5362-4ec1-8687-eab208a25726" />

### 9. kubectl get nodes, kubectl get pods, kubectl get svc
<img width="452" height="182" alt="image" src="https://github.com/user-attachments/assets/c13ed594-a4f3-4af1-996e-0460ac4e16b3" />

### 13. Terraform State in S3 Bucket
<img width="452" height="166" alt="image" src="https://github.com/user-attachments/assets/9c2493fd-a4ab-4f00-bef7-c2e3e8b72c88" />

### 14. Security Group Rules
<img width="452" height="220" alt="image" src="https://github.com/user-attachments/assets/db481124-7715-45a5-9ce0-92ac17ed4237" />
<img width="452" height="239" alt="image" src="https://github.com/user-attachments/assets/0dc1ff15-900b-4020-bb89-2de18b2b9178" />






