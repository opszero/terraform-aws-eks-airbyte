#lables
variable "name" {
  type        = string
  default     = "airbyte"
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "managedby" {
  type        = string
  default     = "opsZero"
  description = "ManagedBy, eg 'opszero'."
}

variable "repository" {
  type        = string
  default     = "https://github.com/opszero/terraform-aws-eks-airbyte.git"
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment", ]
  description = "Label order, e.g. `name`,`environment`."
}

#networking
variable "allowed_ip" {
  type        = list(any)
  default     = []
  description = "List of allowed ip."
}

variable "allowed_ports" {
  type        = list(any)
  default     = [5432]
  description = "List of allowed ingress ports"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The ID of the VPC that the instance security group belongs to."
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "A list of VPC Subnet IDs to launch in."
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Bool to control if instance is publicly accessible"
}
#storage
variable "allocated_storage" {
  type        = number
  default     = 50
  description = "The allocated storage in gigabytes"
}

#logs
variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = ["postgresql", "upgrade"]
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
}
#database
variable "db_name" {
  type        = string
  default     = "airbyte"
  description = "The DB name to create. If omitted, no database is created initially"
}

variable "username" {
  type        = string
  default     = "postgres"
  description = "Username for the master DB user"
}


variable "password" {
  type        = string
  default     = ""
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "instance_class" {
  type        = string
  default     = null
  description = "The instance type of the RDS instance"
}

#airbye
variable "namespace" {
  type        = string
  default     = "tools"
  description = "namespace of airbyte   (e.g. `tools` or `prod`)."
}

variable "airbyte_version" {
  type        = string
  default     = "0.50.21"
  description = "version of airbyte hemm chart."
}
