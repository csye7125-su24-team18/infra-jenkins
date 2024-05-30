# Creating VPC
resource "aws_vpc" "jenkins_tf_vpc" {
  cidr_block = var.cidr
  tags = {
    Name = var.vpcname
  }
}

# Creating Subnet
resource "aws_subnet" "jenkins_tf_subnet" {
  vpc_id                  = aws_vpc.jenkins_tf_vpc.id
  cidr_block              = var.sub_cidr
  map_public_ip_on_launch = var.iplaunch
  availability_zone       = var.subnet_region
  tags = {
    Name = var.subnetname
  }
}

# Creating Internet Gateways
resource "aws_internet_gateway" "jenkins_tf_igw" {
  vpc_id = aws_vpc.jenkins_tf_vpc.id
  tags = {
    Name = var.igwname
  }
}

# Creating Route Table
resource "aws_route_table" "jenkins_tf_routing" {
  vpc_id = aws_vpc.jenkins_tf_vpc.id
  route {
    cidr_block = var.cidr_routing
    gateway_id = aws_internet_gateway.jenkins_tf_igw.id
  }
  tags = {
    Name = var.routingtablename
  }
}

# Associating Route table with Subnet
resource "aws_route_table_association" "jenkins_tf_routing_association" {
  subnet_id      = aws_subnet.jenkins_tf_subnet.id
  route_table_id = aws_route_table.jenkins_tf_routing.id
}

# Creating Security Group
resource "aws_security_group" "jenkins_tf_sg" {
  vpc_id = aws_vpc.jenkins_tf_vpc.id
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = var.protocol
    cidr_blocks = var.cidr_sg
  }
  ingress {
    from_port   = var.sec_port
    to_port     = var.sec_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_sg
  }
  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_sg
  }
  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.cidr_sg
  }
  tags = {
    Name = var.securitygrpname
  }
}



