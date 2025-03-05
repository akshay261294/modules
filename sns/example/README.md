<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_sns_topic"></a> [aws\_sns\_topic](#module\_aws\_sns\_topic) | ../ | n/a |
| <a name="module_sns_fifo"></a> [sns\_fifo](#module\_sns\_fifo) | ../ | n/a |
| <a name="module_sns_with_delivery_policy"></a> [sns\_with\_delivery\_policy](#module\_sns\_with\_delivery\_policy) | ../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | Provides details about a specific AWS region. | `string` | `"ap-south-1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->