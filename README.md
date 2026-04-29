# aws-eks-devops-pipeline-myProject

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
│
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
