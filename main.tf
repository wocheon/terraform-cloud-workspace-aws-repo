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

module "ebs_volume" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws//modules/aws_elastic_ip"
  version = "1.0.3"
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  iops              = var.iops
  throughput        = var.throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  tags              = var.tags
}

output "ebs.volume_id" {
  value = module.ebs_volume.volume_id
}