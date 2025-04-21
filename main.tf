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

module "aws-module-registry" {

}

# 조건부 EIP 생성
module "eip" {
  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws_elastic_ip"
  version = "1.0.0"
  count  = var.aws_eip_allocation_id == "" ? 1 : 0
  aws_eip_name                 = var.aws_eip_name
  aws_eip_vpc                  = var.aws_eip_vpc
  aws_eip_network_border_group = var.aws_eip_network_border_group
  aws_eip_public_ipv4_pool     = var.aws_eip_public_ipv4_pool
  aws_eip_tags                 = var.aws_eip_tags
}

#module "ec2_instance" {
#  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws_ec2"
#  version = "1.0.0"
#  aws_region 		= var.aws_region
#  ami           	= var.ami
#  instance_type 	= var.instance_type
#  key_name      	= var.key_name
#  subnet_id     	= var.subnet_id
#  security_group_ids 	= var.security_group_ids
#  associate_public_ip 	= var.associate_public_ip
#  root_volume_size   	= var.root_volume_size
#  root_volume_type   	= var.root_volume_type
#  instance_name      	= var.instance_name
#}


#module "eip_associate" {
#  source  = "app.terraform.io/terraform_cloud_wocheon/aws-module-registry/aws_elastic_ip_associate "
#  version = "1.0.0"
#  instance_id = moudle.ec2_instance.instance_id
#  allocation_id = var.eip_allocation_id != "" ? var.eip_allocation_id : module.eip[0].allocation_id
#}