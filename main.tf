terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44"
    }
  }
}

#---------------------------------------------------------------------
# Provider
#---------------------------------------------------------------------
provider "aws" {
  region = var.region
}

#---------------------------------------------------------------------
# VPC: 2 public subnets, no NAT (cheapest)
#---------------------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.5"

  name = "eks-budget"

  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnet_cidrs

  enable_nat_gateway      = false
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true
}

#---------------------------------------------------------------------
# EKS Cluster + single Spot node
#---------------------------------------------------------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 20.37.0"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  # Gives your IAM user cluster-admin (handy for practice)
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      ami_type       = "AL2_x86_64"
      instance_types = [var.node_instance_type]
      capacity_type  = var.node_capacity_type

      desired_size = var.node_desired_size
      min_size     = var.node_desired_size
      max_size     = var.node_desired_size

      disk_size  = var.node_disk_size
      subnet_ids = module.vpc.public_subnets

      tags = {
        Purpose = "practice"
      }
    }
  }

  # Core add‑ons (free)
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }
}
