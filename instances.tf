# vim:ts=2:sw=2:et:

resource "aws_rds_cluster_instance" "instances" {
  count = var.db_instances

  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.cluster.id
  engine             = var.cluster_engine
  instance_class     = var.db_instance_class

  publicly_accessible     = false
  db_subnet_group_name    = local.db_subnet_group
  db_parameter_group_name = local.db_parameter_group

  copy_tags_to_snapshot        = true
  #preferred_backup_window      = var.preferred_backup_window
  #preferred_maintenance_window = var.preferred_maintenance_window
  
  monitoring_role_arn = local.db_monitoring_role_arn
  monitoring_interval = var.db_monitoring_interval

  auto_minor_version_upgrade   = var.db_minor_version_upgrade

  tags = var.tags
}

