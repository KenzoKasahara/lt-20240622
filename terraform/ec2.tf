# EC2：1台目
resource "aws_instance" "lt_20240616_ec2_1" {
  ami                                  = "ami-0f9fe1d9214628296"
  associate_public_ip_address          = true
  availability_zone                    = "ap-northeast-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  key_name                             = null
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = aws_subnet.demo_public_subnet_1a_lt_20240622.id
  tags = {
    Name = "lt-20240616-ec2-1"
  }
  tenancy                     = "default"
  vpc_security_group_ids      = [aws_security_group.demo_lt_public_sg.id]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

# EC2：2台目
# resource "aws_instance" "lt_20240616_ec2_2" {
#   ami                                  = "ami-0f9fe1d9214628296"
#   associate_public_ip_address          = true
#   availability_zone                    = "ap-northeast-1a"
#   disable_api_stop                     = false
#   disable_api_termination              = false
#   ebs_optimized                        = false
#   get_password_data                    = false
#   hibernation                          = false
#   instance_type                        = "t2.micro"
#   ipv6_address_count                   = 0
#   key_name                             = null
#   monitoring                           = false
#   placement_group                      = null
#   placement_partition_number           = 0
#   secondary_private_ips                = []
#   security_groups                      = []
#   source_dest_check                    = true
#   subnet_id                            = aws_subnet.demo_public_subnet_1a_lt_20240622.id
#   tags = {
#     Name = "lt-20240616-ec2-2"
#   }
#   tenancy                     = "default"
#   vpc_security_group_ids      = [aws_security_group.demo_lt_public_sg.id]
#   capacity_reservation_specification {
#     capacity_reservation_preference = "open"
#   }
#   cpu_options {
#     amd_sev_snp      = null
#     core_count       = 1
#     threads_per_core = 1
#   }
#   credit_specification {
#     cpu_credits = "standard"
#   }
#   enclave_options {
#     enabled = false
#   }
#   maintenance_options {
#     auto_recovery = "default"
#   }
#   metadata_options {
#     http_endpoint               = "enabled"
#     http_protocol_ipv6          = "disabled"
#     http_put_response_hop_limit = 2
#     http_tokens                 = "required"
#     instance_metadata_tags      = "disabled"
#   }
#   private_dns_name_options {
#     enable_resource_name_dns_a_record    = false
#     enable_resource_name_dns_aaaa_record = false
#     hostname_type                        = "ip-name"
#   }
#   root_block_device {
#     delete_on_termination = true
#     encrypted             = false
#     iops                  = 3000
#     kms_key_id            = null
#     tags                  = {}
#     tags_all              = {}
#     throughput            = 125
#     volume_size           = 8
#     volume_type           = "gp3"
#   }
# }