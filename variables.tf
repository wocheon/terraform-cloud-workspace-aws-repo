variable "aws_region" {
  description = "AWS 리전"
  type        = string
}


variable "aws_eip_allocation_id" {
  description = "EC2 인스턴스의 AMI ID"
  type        = string
  default = null
}


variable "aws_eip_vpc" {
  description = "Whether to allocate the address for use with instances in a VPC"
  type        = bool
  default     = true
}

variable "aws_eip_name" {
  description = "Name tag for the EIP"
  type        = string
  default     = "my-eip"
}

variable "aws_eip_network_border_group" {
  description = "Set the location from which the EIP will be advertised"
  type        = string
  default     = null
}

variable "aws_eip_public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier or amazon"
  type        = string
  default     = null
}

variable "aws_eip_tags" {
  description = "Additional tags to associate with the EIP"
  type        = map(string)
  default     = {}
}
