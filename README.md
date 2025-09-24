# terraform-aws-eks-airbyte

# Terraform AWS Cloud eks-airbyte Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#Examples)
- [Author](#Author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This Terraform module creates an AWS elasticache along with additional configuration options.

## Usage
To use this module, you can include it in your Terraform configuration. Here's an example of how to use it:

## Examples:

## Example: eks-airbyte

```hcl
module "airbyte" {
  source         = "git::https://github.com/opszero/terraform-aws-eks-airbyte.git?ref=v1.0.0"
  environment    = "prod"
  instance_class = "db.t3.micro"
  vpc_id         = "vpc-xxxxxxxxxx" # add vpc id here
  subnet_ids     = ["subnets-xxxxxxx", "subnets-xxxxxxxx"]
  password       = "" #if add some password
  allowed_ip     = ["0.0.0.0/0"]
}
```

## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/opszero/terraform-aws-eks-airbyte.git) directory within this repository.

## Author
Your Name Replace **MIT** and **[opszero](https://github.com/opszero/terraform-aws-eks-airbyte.git)** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** [License](https://github.com/opszero/terraform-aws-eks-airbyte.git) - see the LICENSE file for details.






<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airbyte_version"></a> [airbyte\_version](#input\_airbyte\_version) | version of airbyte hemm chart. | `string` | `"0.50.21"` | no |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gigabytes | `number` | `50` | no |
| <a name="input_allowed_ip"></a> [allowed\_ip](#input\_allowed\_ip) | List of allowed ip. | `list(any)` | `[]` | no |
| <a name="input_allowed_ports"></a> [allowed\_ports](#input\_allowed\_ports) | List of allowed ingress ports | `list(any)` | <pre>[<br>  5432<br>]</pre> | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The DB name to create. If omitted, no database is created initially | `string` | `"airbyte"` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | <pre>[<br>  "postgresql",<br>  "upgrade"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `"prod"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`environment`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'opszero'. | `string` | `"opsZero"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `"airbyte"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | namespace of airbyte   (e.g. `tools` or `prod`). | `string` | `"tools"` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | `""` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/opszero/terraform-aws-eks-airbyte.git"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of VPC Subnet IDs to launch in. | `list(string)` | `[]` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user | `string` | `"postgres"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC that the instance security group belongs to. | `string` | `""` | no |
## Resources

| Name | Type |
|------|------|
| [helm_release.airbyte](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/3.7.2/docs/resources/password) | resource |
## Outputs

No outputs.
# 🚀 Built by opsZero!

<a href="https://opszero.com"><img src="https://opszero.com/wp-content/uploads/2024/07/opsZero_logo_svg.svg" width="300px"/></a>

Since 2016 [opsZero](https://opszero.com) has been providing Kubernetes
expertise to companies of all sizes on any Cloud. With a focus on AI and
Compliance we can say we seen it all whether SOC2, HIPAA, PCI-DSS, ITAR,
FedRAMP, CMMC we have you and your customers covered.

We provide support to organizations in the following ways:

- [Modernize or Migrate to Kubernetes](https://opszero.com/solutions/modernization/)
- [Cloud Infrastructure with Kubernetes on AWS, Azure, Google Cloud, or Bare Metal](https://opszero.com/solutions/cloud-infrastructure/)
- [Building AI and Data Pipelines on Kubernetes](https://opszero.com/solutions/ai/)
- [Optimizing Existing Kubernetes Workloads](https://opszero.com/solutions/optimized-workloads/)

We do this with a high-touch support model where you:

- Get access to us on Slack, Microsoft Teams or Email
- Get 24/7 coverage of your infrastructure
- Get an accelerated migration to Kubernetes

Please [schedule a call](https://calendly.com/opszero-llc/discovery) if you need support.

<br/><br/>

<div style="display: block">
  <img src="https://opszero.com/wp-content/uploads/2024/07/aws-advanced.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-public-sector.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-eks.png" width="150px" />
</div>
<!-- END_TF_DOCS -->