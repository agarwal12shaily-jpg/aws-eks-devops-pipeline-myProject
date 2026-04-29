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
<img width="452" height="436" alt="image" src="https://github.com/user-attachments/assets/60b0fa21-adea-4b2d-94c4-693a023f23ff" />

### 3. AWS Console – Jenkins EC2 Running
<img width="452" height="219" alt="image" src="https://github.com/user-attachments/assets/f32e8366-0618-47cf-8c33-e99d51f63652" />

### 4. Jenkins Login Page

### 5. Jenkins Dashboard

### 6. Jenkins Build Success

### 7. AWS Console – VPC Created
#### jenkins-vpc
<img width="452" height="219" alt="image" src="https://github.com/user-attachments/assets/66dfc8f7-5f4b-49c8-8940-ec9bb495b895" />

#### eks-vpc
<img width="452" height="213" alt="image" src="https://github.com/user-attachments/assets/7e2d9c71-b13e-43ba-9b47-bec504e19d50" />


### 8. AWS Console – EKS Cluster Active

### 9. kubectl get nodes

### 10. kubectl get pods

### 11. kubectl get svc

### 12.NGINX App Running in Browser

### 13. Terraform State in S3 Bucket
<img width="452" height="128" alt="image" src="https://github.com/user-attachments/assets/6ab6aea4-114e-4614-b8f0-df815e4ab4c4" />

### 14. Security Group Rules
<img width="452" height="212" alt="image" src="https://github.com/user-attachments/assets/4c3a0853-cc28-489a-bb6d-fddeac674aa3" />

### 15. Jenkins Installed Tools
<img width="452" height="202" alt="image" src="https://github.com/user-attachments/assets/d02dc4fa-2a20-47bb-8da5-7332185f678c" />










