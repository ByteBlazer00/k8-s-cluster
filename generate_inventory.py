
import json
import subprocess

# Fetch Terraform Outputs
result = subprocess.run(['terraform', 'output', '-json'], capture_output=True, text=True)
outputs = json.loads(result.stdout)

# Extract IPs
master_public_ip = outputs['master_public_ip']['value']
worker_private_ips = outputs['worker_private_ips']['value']
haproxy_public_ip = outputs['haproxy_public_ip']['value']

# Generate inventory.ini
inventory_content = f"""
[masters]
{master_public_ip} ansible_user=ubuntu

[workers]
"""

for ip in worker_private_ips:
    inventory_content += f"{ip} ansible_user=ubuntu\n"

with open('inventory.ini', 'w') as file:
    file.write(inventory_content)

print("Inventory file generated successfully: inventory.ini")

# Generate haproxy.ini
haproxy_content = f"""
[haproxy]
{haproxy_public_ip} ansible_user=ubuntu
"""

with open('haproxy.ini', 'w') as file:
    file.write(haproxy_content)

print("HAProxy file generated successfully: haproxy.ini")