variable "infra-region" {
  description = "Region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public-subnet-cidrs" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] #this is to identify you range of ip addresses for your public subnets

}

variable "availability_zones" {
  description = "Availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ami-ec2-instance" {
  description = "AMI for the EC2 instance"
  type        = string
  default     = "ami-00a929b66ed6e0de6" #this is the AMI for the EC2 instance
}

variable "instance-type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

