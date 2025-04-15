output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.MyVPC.id
}

# Subnet IDs
output "subnet_ids" {
  value       = [for subnet in aws_subnet.public_subnet : subnet.id]
  description = "IDs of the public subnets"
}

# Public IPs of EC2 Instances
output "ec2_public_ips" {
  value       = [for instance in aws_instance.MyInstance1 : instance.public_ip]
  description = "Public IPs of the EC2 instances"
}


# output "subnet_id" {
#description = "The ID of the public subnets" 
#value = "${aws_subnet.public_subnets.*.id}"
#}

# output "instance_public_ips" {
#description = "The public IPs of the instances" 
# value = "${aws_instance.main_infra_instance.*.public_ip}"
#}