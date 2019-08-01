# vim:ts=2:sw=2:et:

variable "tags" {
  type        = map
  description = ""
  default     = {}
}

variable "cluster_identifier" {
  type        = string
  description = "(required) Cluster identifier"
}

variable "cluster_engine" {
  type        = string
  description = "(required) Aurora engine"
}

variable "cluster_engine_version" {
  type        = string
  description = "(required) Engine version"
}

variable "cluster_engine_mode" {
  type        = string
  description = "(optional - default: provisioned) Cluster engine mode (global, parallelquery, provisioned, serverless)"
  default     = "provisioned"
}

variable "cluster_azs" {
  type        = list
  description = "(required) List of availability zones"
}

variable "cluster_subnet_ids" {
  type        = list
  description = "(optional - default: empty) List of subnet ids. Required if db_subnet_group_name is empty and needs to be created by the module"
}

variable "db_subnet_group_name" {
  type        = string
  description = "(optional - default: empty) DB subnet group name. If empty, the module will create it"
  default     = ""
}

variable "cluster_parameter_group_name" {
  type        = string
  description = "(optional - default: empty) Cluster parameter group"
  default     = ""
}

variable "cluster_storage_encrypted" {
  type        = bool
  description = ""
  default     = true
}

variable "skip_final_snapshot" {
  type        = bool
  description = "(optional - default: false) Skip final snapshot creation when the cluster is terminated"
  default     = false
}

variable "final_snapshot_id" {
  type        = string
  description = "(optional - default: empty) Final snapshot identifier when the cluster is terminated"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "(optional - default: empty) VPC ID. Required if create_security_group is true"
  default     = ""
}

variable "create_security_group" {
  type        = bool
  description = "(optional - default: true) Create a security group to be associated with the cluster"
  default     = true
}

variable "security_group_rules" {
  type        = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    self            = bool
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
  description = "(optional - default: []) List of security group rules for the SG created by this module"
  default     = []
}

variable "security_group_ids" {
  type        = list
  description = "(optional - default: []) List of security group IDs to associate with the cluster"
  default     = []
}

variable "admin_user" {
  type        = string
  description = ""
  default     = ""
}

variable "admin_pass" {
  type        = string
  description = ""
  default     = ""
}

variable "iam_auth_enabled" {
  type        = bool
  description = "(optional - default: true)"
  default     = true
}

variable "db_name" {
  type        = string
  description = ""
  default     = ""
}

variable "backup_retention_period" {
  type        = number
  description = ""
  default     = 5
}

variable "preferred_backup_window" {
  type        = string
  description = ""
  default     = "00:00-01:00"
}

variable "preferred_maintenance_window" {
  type        = string
  description = ""
  default     = "mon:22:00-mon:23:00"
}

variable "deletion_protection" {
  type        = bool
  description = ""
  default     = false
}

variable "db_parameter_group_name" {
  type        = string
  description = "(optional - default: empty) DB parameter group"
  default     = ""
}

