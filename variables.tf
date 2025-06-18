variable "region" {
  description = "AWS region to deploy the cluster."
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "eks-practice-infra"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane."
  type        = string
  default     = "1.31"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.42.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets."
  type        = list(string)
  default     = ["10.42.10.0/24", "10.42.20.0/24"]
}

variable "azs" {
  description = "Availability Zones for the subnets."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes."
  type        = string
  default     = "t3.small"
}

variable "node_capacity_type" {
  description = "Instance capacity type: SPOT or ON_DEMAND."
  type        = string
  default     = "SPOT"
}

variable "node_disk_size" {
  description = "EBS disk size (GiB) for worker nodes."
  type        = number
  default     = 10
}

variable "node_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 1
}
