
locals {
  common_tags = {
    Application = var.application_name
    Environment = var.environment
  }
}
terraform {
  required_version = ">= 1.0"
}
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hechaorganization"
    workspaces {
      name = "golang-napoli-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = local.common_tags
  }
}

module "infrastructure" {
  source              = "./modules/infra"
  acm_certificate_arn = var.acm_certificate_arn
  domain_name         = var.domain_name
  route53_zone_id     = var.route53_zone_id
  tags                = local.common_tags
  bucket_suffix       = var.bucket_suffix
}

module "iam" {
  source                      = "./modules/security"
  bucket_arn                  = module.infrastructure.bucket_arn
  cloudfront_distribution_arn = module.infrastructure.cloudfront_distribution_arn
  tags                        = local.common_tags
}
