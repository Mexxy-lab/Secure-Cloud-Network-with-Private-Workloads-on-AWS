# Output only the information needed for administration and verification.
output "vpc_id" {
  description = "ID of the project VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public bastion subnet."
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private application subnet."
  value       = aws_subnet.private.id
}

output "bastion_public_ip" {
  description = "Public IPv4 address used for restricted SSH access."
  value       = aws_instance.bastion.public_ip
}

output "application_private_ip" {
  description = "Private IPv4 address of the application VM."
  value       = aws_instance.application.private_ip
}

output "application_public_ip" {
  description = "Must be null: the application VM must not have a public IP."
  value       = aws_instance.application.public_ip
}

output "ssh_bastion_command" {
  description = "SSH command for the bastion host."
  value       = "ssh -i ${pathexpand(var.public_key_path) == "" ? "" : replace(pathexpand(var.public_key_path), ".pub", "")} ubuntu@${aws_instance.bastion.public_ip}"
}