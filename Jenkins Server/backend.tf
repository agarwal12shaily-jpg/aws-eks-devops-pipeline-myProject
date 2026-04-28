terraform {
  backend "s3" {
    bucket = "aws-eks-terraform-pipeline"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}