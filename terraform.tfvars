### AWS Region Configs ###

aws_region         = "ap-northeast-2"

### AWS EBS Configs ###
ebs_availability_zone = "ap-northeast-2a"
ebs_size              = 100
ebs_type              = "gp3"
ebs_iops              = 3000
ebs_throughput        = 125
ebs_encrypted         = true
ebs_tags = {
  Name = "example-ebs-volume"
}