# Project Aegis: AWS EKS Cluster Configuration
provider "aws" {
  region = "us-east-1"
}

# Define the VPC for the Cluster
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "aegis-vpc"
  cidr    = "10.0.0.0/16"
  azs     = ["us-east-1a", "us-east-1b"]
  
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  
  enable_nat_gateway = true
}

# Define the EKS Cluster (The Kubernetes layer)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name    = "aegis-production-cluster"
  cluster_version = "1.29"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # Logic for Okta/IAM Identity integration
  enable_irsa = true 
}
