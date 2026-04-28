terraform {
  backend "s3" {
    bucket = "aws-eks-terraform-pipeline"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}