# Getting the Hosted domain name

data "aws_route53_zone" "primary_tf" {
  name = var.domainname
}

# Getting the Elastic IP from console
data "aws_eip" "existing_eip_tf" {
  public_ip = var.ip
}

# Creating "A" record for jenkins
resource "aws_route53_record" "jenkins_subdomain_tf" {
  zone_id = data.aws_route53_zone.primary_tf.zone_id
  name    = var.subdomain
  type    = var.rec
  ttl     = var.ttl
  records = [data.aws_eip.existing_eip_tf.public_ip]
}

# Associating Elastic IP with Instances
resource "aws_eip_association" "jenkins_tf_eip_assoc" {
  instance_id   = aws_instance.jenkins_tf_instance.id
  allocation_id = data.aws_eip.existing_eip_tf.id
}
