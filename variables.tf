variable "region" {
  default = "us-east-1"
}

#  VPC Setup variables
variable "cidr" {
  default = "10.0.0.0/16"
}
variable "vpcname" {
  default = "vpc_jenkins"
}

# Subnet setup variables
variable "sub_cidr" {
  default = "10.0.1.0/24"
}
variable "iplaunch" {
  default = true
}
variable "subnetname" {
  default = "subnet_jenkins"
}
variable "subnet_region" {
  default = "us-east-1a"
}

# Setup Internet gateway variables
variable "igwname" {
  default = "igw_jenkins"
}

# Setup Routing table variables
variable "cidr_routing" {
  default = "0.0.0.0/0"
}

variable "routingtablename" {
  default = "routing_table_jenkins"
}

# Setup Security group variables
variable "port" {
  default = "80"
}
variable "protocol" {
  default = "tcp"
}
variable "sec_port" {
  default = "443"
}
variable "ingress_port" {
  default = "22"
}
variable "egress_port" {
  default = "0"
}
variable "egress_protocol" {
  default = "-1"
}
variable "securitygrpname" {
  default = "security_group_jenkins"
}
variable "cidr_sg" {
  default = ["0.0.0.0/0"]
}
# Setup Elastic IP variables
variable "eip_name" {
  default = "eip_jenkins"
}

# setup Instances variables
variable "ami" {
  default = "ami-09681321ec0e41d06"
}
variable "instances_type" {
  default = "t2.micro"
}
variable "key" {
  default = "jenkins_instance_key"
}
variable "instances_name" {
  default = "Instances_for_jenkins"
}

# Setup Route53 variables
variable "domainname" {
  default = "poojacloud24.pw"
}
variable "ip" {
  default = "34.193.78.173"
}
variable "subdomain" {
  default = "jenkins.poojacloud24.pw"
}
variable "rec" {
  default = "A"
}
variable "ttl" {
  default = "300"
}