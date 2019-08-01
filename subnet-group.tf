# vim:ts=2:sw=2:et:

resource "aws_db_subnet_group" "cluster" {
  count = var.db_subnet_group_name == "" ? 1 : 0

  name       = var.cluster_identifier
  subnet_ids = var.cluster_subnet_ids

  tags = var.tags
}

output "db-subnet-group" {
  value = var.db_subnet_group_name == "" ? aws_db_subnet_group.cluster[0].id : var.db_subnet_group_name
}

