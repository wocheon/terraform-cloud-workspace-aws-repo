### AWS Region Configs ###

variable "aws_region" {
  description = "AWS 리전"
  type        = string
}

### AWS S3 Bucket Config ###

variable "aws_s3_bucket" {
  type = string
}

variable "aws_s3_acl" {
  type    = string
  default = "private"
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
  default     = error.html
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

