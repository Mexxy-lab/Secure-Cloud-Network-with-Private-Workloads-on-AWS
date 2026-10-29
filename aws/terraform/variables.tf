# AWS region in which the lab will be deployed.
variable "aws_region" {
  description = "AWS region for the secure network lab."
  type        = string
  default     = "us-east-1"
}

# Prefix for resources so they are easy to identify and clean up.
variable "project_name" {
  description = "Prefix used to name project resources."
  type        = string
  default     = "secure-cloud-network"
}

# Restrict SSH to your own trusted public IPv4 address.
variable "trusted_ssh_cidr" {
  description = "Trusted public IPv4 address in CIDR /32 format."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.trusted_ssh_cidr)) && endswith(var.trusted_ssh_cidr, "/32")
    error_message = "Provide one trusted IPv4 address in /32 format, such as 198.51.100.25/32."
  }
}

# Use a small instance type for this learning lab.
variable "instance_type" {
  description = "EC2 instance type for the bastion and application server."
  type        = string
  default     = "t3.micro"
}

# Public key path; only the public key is uploaded to AWS.
variable "public_key_path" {
  description = "Path to the SSH public key on the Terraform workstation."
  type        = string
  default     = "~/.ssh/linux_hardening_ed25519.pub"
}