### AWS Region Configs ###

aws_region         = "ap-northeast-2"

### AWS S3 Bucket Config ###

aws_s3_bucket               = "terraform-aws-test-buckect-ciw0707"
aws_s3_force_destroy        = true
aws_s3_object_lock_enabled  = true
aws_s3_tags                 = { Name = "terraform-aws-test-buckect-ciw0707" , User = "ciw0707" }

### AWS S3 Bucket Versioning Config ###

aws_s3_version_enabled      = true
aws_s3_version_mfa_delete   = false

### AWS S3 Bucket Website Config ###

aws_s3_index_document         = "index.html"
aws_s3_error_document         = "error.html"

aws_s3_redirect_routing_rules = [
    {
      condition = {
        key_prefix_equals = "docs/"
      }
      redirect = {
        host_name = "docs.example.com"
        protocol  = "https"
      }
    }
  ]

### AWS S3 Access Point Config ###

aws_s3_access_point_name  = "my-access-point"
aws_s3_access_point_policy  = ""
aws_s3_access_point_vpc_id  = "vpc-0594829912674d4b3"
aws_s3_access_point_tags  = { Name = "terraform-aws-test-buckect-ciw0707" , User = "ciw0707" }

### AWS S3 Account Public Access Block Config ###
aws_s3_apab_block_public_acls       = true
aws_s3_apab_block_public_policy     = true
aws_s3_apab_ignore_public_acls      = true
aws_s3_apab_restrict_public_buckets = true

### AWS S3 ACL Config ###

aws_s3_acl  = "private"