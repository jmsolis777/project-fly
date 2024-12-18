variable "region" {
  type = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type = string
  description = "Subnet CIDR block"
  default     = "10.0.1.0/24"
}

variable "eks_cluster_name" {
  type = string
  description = "EKS Cluster name"
  default     = "my-eks-cluster"
}
