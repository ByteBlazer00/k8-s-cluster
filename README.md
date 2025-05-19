# k8-s-cluster


# k8s-cluster

Infrastructure-as-Code (IaC) project to provision a highly available Kubernetes cluster on AWS using **Terraform** and **Ansible**.

---

## 🌐 Project Overview

This project automates the setup of a production-grade Kubernetes cluster on AWS with the following key components:

- **Terraform** – for provisioning AWS infrastructure
- **Ansible** – for configuring and bootstrapping the Kubernetes cluster
- **kubeadm** – for initializing the Kubernetes cluster
- **HAProxy** – for load balancing and acting as a bastion host
- **Calico** – as the CNI (Container Network Interface) plugin

---

## 🧱 Infrastructure Architecture

- **Cloud Provider**: AWS (EC2-based setup)
- **Networking**:
  - VPC with public and private subnets
  - Internet Gateway and Route Tables
  - Security Groups for controlled access
- **Instances**:
  - 1 HAProxy (bastion + load balancer) - Public Subnet
  - 1 Master Node - Public Subnet
  - 2 Worker Nodes - Private Subnet

---

## 📁 Directory Structure


