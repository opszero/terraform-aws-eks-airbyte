# Password auto generate
resource "random_password" "password" {
  count   = var.password == "" ? 1 : 0
  length  = 16
  special = true
}

module "postgresql" {
  source                          = "git::https://github.com/opszero/terraform-aws-rds.git?ref=v1.0.1"
  name                            = var.name
  allowed_ip                      = var.allowed_ip
  allowed_ports                   = var.allowed_ports
  vpc_id                          = var.vpc_id
  subnet_ids                      = var.subnet_ids
  publicly_accessible             = var.publicly_accessible
  allocated_storage               = var.allocated_storage
  storage_encrypted               = true
  backup_retention_period         = 7
  backup_window                   = "03:00-06:00"
  maintenance_window              = "Mon:00:00-Mon:03:00"
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  db_name                         = var.db_name
  db_username                     = var.username
  password                        = var.password == "" ? join("", random_password.password.*.result) : var.password
  port                            = "5432"
  instance_class                  = var.instance_class
  engine                          = "postgres"
  engine_name                     = "postgres"
  engine_version                  = "14.10"
  family                          = "postgres14"
  major_engine_version            = "14"
  multi_az                        = false
  apply_immediately               = true
  deletion_protection             = true
  ssm_parameter_endpoint_enabled  = false

}

resource "helm_release" "airbyte" {
  depends_on       = [module.postgresql]
  chart            = "airbyte"
  name             = var.name
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://airbytehq.github.io/helm-charts"
  version          = var.airbyte_version
  values           = [file("airbyte.yaml")]
  set = [
    {
      name  = "externalDatabase.host"
      value = module.postgresql.db_instance_address
    },
    {
      name  = "externalDatabase.password"
      value = var.password == "" ? join("", random_password.password.*.result) : var.password
    }
  ]

}