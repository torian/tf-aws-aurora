# vim:ts=2:sw=2:et:

resource "aws_rds_cluster" "cluster" {

  cluster_identifier                  = var.cluster_identifier
  engine                              = var.cluster_engine
  engine_version                      = var.cluster_engine_version
  engine_mode                         = var.cluster_engine_mode
  availability_zones                  = var.cluster_azs
  storage_encrypted                   = var.cluster_storage_encrypted
  vpc_security_group_ids              = local.security_group_ids
  db_subnet_group_name                = local.db_subnet_group
  db_cluster_parameter_group_name     = local.cluster_parameter_group
  iam_database_authentication_enabled = var.iam_auth_enabled

  database_name   = local.db_name
  master_username = local.admin_user
  master_password = local.admin_pass

  skip_final_snapshot          = var.skip_final_snapshot
  final_snapshot_identifier    = local.final_snapshot_id

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  copy_tags_to_snapshot        = true
  deletion_protection          = var.deletion_protection
}

