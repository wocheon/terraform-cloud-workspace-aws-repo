terraform {
  # Terraform Cloud Workspace
  cloud { 
    organization = "terraform_cloud_wocheon" 
    workspaces { 
      name = "terraform-cloud-workspace-aws-repo" 
    } 
  } 
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.29.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  module_version = "1.0.3"
}

# S3 버킷 생성
module "s3_bucket" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_bucket"
  version = local.module_version
  aws_s3_bucket               = var.aws_s3_bucket  
  aws_s3_force_destroy        = var.aws_s3_force_destroy
  aws_s3_object_lock_enabled  = var.aws_s3_object_lock_enabled
  aws_s3_tags                 = var.aws_s3_tags
}


# 버전 관리 활성화
module "s3_versioning" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_versioning"
  version = local.module_version
  aws_s3_bucket             = module.s3_bucket.bucket_id
  aws_s3_version_enabled    = var.aws_s3_version_enabled 
  aws_s3_version_mfa_delete = var.aws_s3_version_mfa_delete
}

# 웹사이트 호스팅 설정
module "s3_website" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_website"
  version = local.module_version
  aws_s3_bucket                 = module.s3_bucket.bucket_id
  aws_s3_index_document         = var.aws_s3_index_document
  aws_s3_error_document         = var.aws_s3_error_document
  aws_s3_redirect_routing_rules = var.aws_s3_redirect_routing_rules
}

# Access Point 설정
module "s3_access_point" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_access_point"
  version = local.module_version
  aws_s3_bucket                 = module.s3_bucket.bucket_id
  aws_s3_access_point_name      = var.aws_s3_access_point_name  
  aws_s3_access_point_policy    = var.aws_s3_access_point_policy
  aws_s3_access_point_vpc_id    = var.aws_s3_access_point_vpc_id
  aws_s3_access_point_tags      = var.aws_s3_access_point_tags
}

# Public Accees 설정 
module "s3_account_public_access_block" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_account_public_access_block"
  version = local.module_version
  aws_s3_bucket                       = module.s3_bucket.bucket_id
  aws_s3_apab_block_public_acls       = var.aws_s3_apab_block_public_acls
  aws_s3_apab_block_public_policy     = var.aws_s3_apab_block_public_policy
  aws_s3_apab_ignore_public_acls      = var.aws_s3_apab_ignore_public_acls
  aws_s3_apab_restrict_public_buckets = var.aws_s3_apab_restrict_public_buckets
}

# ACL 설정
module "s3_bucket_acl" {
  depends_on = [module.s3_account_public_access_block]  
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_s3_acl"
  version = local.module_version
  aws_s3_bucket = module.s3_bucket.bucket_id
  aws_s3_acl    = var.aws_s3_acl
}



output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "versioning_status" {
  value = module.s3_versioning.versioning_status
}

output "website_endpoint" {
  value = module.s3_website.website_endpoint
}


output "access_point_arn" {
  value = module.s3_access_point.access_point_arn
}

output "access_point_name" {
  value = module.s3_access_point.access_point_name
}


output "public_access_block_status" {
  value = module.s3_account_public_access_block.public_access_block_status
}

