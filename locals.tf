# vim:ts=2:sw=2:et:

locals {
  
  security_group_ids        = var.create_security_group ? [ aws_security_group.cluster[0].id ] : var.security_group_ids
  final_snapshot_id         = var.final_snapshot_id == "" ? "${var.cluster_identifier}-final" : var.final_snapshot_id
  db_subnet_group           = var.db_subnet_group_name != "" ? var.db_subnet_group_name : aws_db_subnet_group.cluster[0].id
  cluster_parameter_group   = null
  db_parameter_group        = null

  db_name    = var.db_name != "" ? var.db_name : null
  # FIXME: set based on global_cluster_identifier
  admin_user = var.admin_user
  admin_pass = var.admin_pass
}

