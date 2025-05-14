variable "region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = can(regex("^([a-z]{2}-[a-z]+-[0-9])$", var.region))
    error_message = "The region must be a valid AWS region (e.g., 'us-east-1')."
  }
}

variable "worker_count" {
  description = "Number of Kubernetes worker nodes"
  type        = number
  default     = 3
  validation {
    condition     = var.worker_count >= 1
    error_message = "The worker_count must be at least 1."
  }
}

variable "local_ip_cidr" {
  description = "CIDR block for your local machine's public IP (for SSH to HAProxy)"
  type        = string
  default     = "223.228.33.51/32" # Replace with your IP or a variable input
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "demo-01"
}

variable "instance_type" {
  description = "EC2 instance type for all nodes"
  type        = string
  default     = "t3.medium"
}

variable "instance_type2" {
  description = "instance type for jenkins"
  type        = string
  default     = "t3.medium"
}

variable "volume_size" {
  description = "Size of the root volume for EC2 instances (in GB)"
  type        = number
  default     = 30
}

variable "volume_size2" {
  description = "Size of the root volume for jenkins server (in GB)"
  type        = number
  default     = 20
}