# vim:ts=2:sw=2:et:

resource "aws_security_group" "cluster" {
  count = var.create_security_group ? 1 : 0
  
  name        = var.cluster_identifier
  description = var.cluster_identifier

  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  #dynamic "ingress" {
  #  iterator = i
  #  for_each = [ for r in var.security_group_rules: {
  #    from_port = r.from_port
  #  }]
  #  content {
  #  
  #  }
  #}
}

output "security-group" {
  value = aws_security_group.cluster[0]
}

