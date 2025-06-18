# EKS Practice Infra (Terraform)

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
