output "haproxy_public_ip" {
  description = "Public IP address of the HAProxy instance"
  value       = aws_instance.haproxy.public_ip
}

output "haproxy_private_ip" {
  description = "Private IP address of the HAProxy instance"
  value       = aws_instance.haproxy.private_ip
}

output "master_public_ip" {
  description = "Public IP address of the Kubernetes master node"
  value       = aws_instance.master.public_ip
}

output "master_private_ip" {
  description = "Private IP address of the Kubernetes master node"
  value       = aws_instance.master.private_ip
}

output "jenkins_public_ip" {
  description = "Public IP of the Jenkins EC2 instance"
  value = aws_instance.jenkins.public_ip
}


output "worker_private_ips" {
  description = "Private IP addresses of the Kubernetes worker nodes"
  value       = [for worker in aws_instance.worker : worker.private_ip]
}