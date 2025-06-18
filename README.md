# EKS Practice Infra 

![Terraform](https://img.shields.io/badge/Terraform-v1.5%2B-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/Built%20with-AWS-orange?logo=amazon-aws)
![EKS](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)
![Node Type](https://img.shields.io/badge/Node--Type-SPOT%20%F0%9F%9A%80-blue)
![Cost-Optimized](https://img.shields.io/badge/Budget--Friendly-%F0%9F%92%B8-green)
![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Last Commit](https://img.shields.io/github/last-commit/KathirGanesan/eks-practice-infra)

This repository contains a minimal-cost Amazon EKS cluster setup using Terraform, tailored for personal learning, DevOps practice, and Certified Kubernetes Administrator (CKA) preparation.

---

## 🚀 Features

- **Single-node EKS Cluster**
  - 1 Spot EC2 instance (`t3.small`) as worker node
  - Managed EKS control-plane by AWS
- **Budget Optimized**
  - No NAT Gateway (saves ~$30/month)
  - Uses public subnets with Internet Gateway
  - Spot instance pricing (~₹250/month)
- **Multi-file Terraform layout**
  - Follows professional structure with `main.tf`, `variables.tf`, `outputs.tf`, and `terraform.tfvars`
- **Core Kubernetes Add-ons enabled**
  - CoreDNS
  - Kube-proxy
  - VPC CNI
- **Easily extendable**
  - Add Ingress Controller, Helm, Calico, or Cluster Autoscaler later

---

## 📁 Folder Structure

| File | Purpose |
|------|---------|
| `main.tf` | Main infrastructure logic (VPC, EKS, NodeGroup) |
| `variables.tf` | Typed input variables |
| `outputs.tf` | Key outputs like kubeconfig path and IAM roles |
| `terraform.tfvars.example` | Sample input values |
| `.gitignore` | Ignore state files and local cache |

---

## 🛠️ How to Use

```bash
# 1. Clone the repo
git clone https://github.com/your-username/eks-practice-infra.git
cd eks-practice-infra

# 2. Initialize and apply
terraform init
terraform apply

# 3. Connect to the cluster
aws eks update-kubeconfig --region ap-south-1 --name eks-budget-demo
kubectl get nodes
```

---

## 💡 Tips for Practice

- Destroy the cluster after each practice session to avoid the ₹0.10/hr control-plane fee:
  ```bash
  terraform destroy
  ```
- Modify `terraform.tfvars` to try different:
  - EC2 instance types (e.g., `t4g.small`)
  - Cluster names
  - Node counts

---

## 📘 License

MIT License. Use and modify freely.
