# personal-website-iac
Infrastracture as code repository for my personal website, you can find more information here -> [How to deploy your own website on AWS with Terraform and Git Hub Actions!](https://ettoreciarcia.com/posts/01-iac-and-pipeline-my-personal-website/)


## Infrastructure Overview
![infrastructure](infrastructure.png)<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/security | n/a |
| <a name="module_infrastructure"></a> [infrastructure](#module\_infrastructure) | ./modules/infra | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | ARN of the ACM certificate to use for the CloudFront distribution | `string` | n/a | yes |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the application | `string` | n/a | yes |
| <a name="input_bucket_suffix"></a> [bucket\_suffix](#input\_bucket\_suffix) | n/a | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name to use for the CloudFront distribution | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment of the application dev/test/prod | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Route53 zone ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
