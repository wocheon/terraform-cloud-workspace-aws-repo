### AWS Region Configs ###

variable "aws_region" {
  description = "AWS 리전"
  type        = string
}

### AWS S3 Bucket Config ###

variable "aws_s3_bucket" {
  type = string
}

variable "aws_s3_force_destroy" {
  type    = bool
  default = false
}

variable "aws_s3_object_lock_enabled" {
  type    = bool
  default = false
}

variable "aws_s3_tags" {
  type    = map(string)
  default = {}
}

### AWS S3 Bucket Versioning Config ###

variable "aws_s3_version_enabled" {
  type    = bool
  default = true
}

variable "aws_s3_version_mfa_delete" {
  type    = bool
  default = false
}

### AWS S3 Bucket Website Config ###


variable "aws_s3_index_document" {
  type        = string
  description = "Index document (e.g., index.html)"
  default     = "index.html"
}

variable "aws_s3_error_document" {
  type        = string
  description = "Error document (e.g., error.html)"
  default     = "error.html"
}

variable "aws_s3_redirect_routing_rules" {
  type = list(object({
    condition = object({
      key_prefix_equals = string
    })
    redirect = object({
      host_name = string
      protocol  = string
    })
  }))
  default = []
}


### AWS S3 Access Point Config ###

variable "aws_s3_access_point_name" {
  type        = string
  description = "The name of the S3 Access Point"
}

variable "aws_s3_access_point_policy" {
  type        = string
  description = "The policy for the Access Point (JSON format)"
  default     = "{}"  # 기본적으로 빈 정책을 설정
}

variable "aws_s3_access_point_vpc_id" {
  type        = string
  description = "The VPC ID to associate the Access Point"
  default     = ""  # VPC ID가 없으면 빈 값
}

variable "aws_s3_access_point_tags" {
  type        = map(string)
  description = "Tags for the Access Point"
  default     = {}
}


### AWS S3 Account Public Access Block Config ###

variable "aws_s3_apab_block_public_acls" {
  type        = bool
  description = "Whether to block public ACLs"
  default     = true
}

variable "aws_s3_apab_block_public_policy" {
  type        = bool
  description = "Whether to block public bucket policies"
  default     = true
}

variable "aws_s3_apab_ignore_public_acls" {
  type        = bool
  description = "Whether to ignore public ACLs"
  default     = true
}

variable "aws_s3_apab_restrict_public_buckets" {
  type        = bool
  description = "Whether to restrict public buckets"
  default     = true
}

### AWS S3 ACL config ###
variable "aws_s3_acl" {
  type    = string
  default = null
}