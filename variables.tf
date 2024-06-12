variable "vpc_id" {
  description = "Default VPC ID"
  type        = string
  default     = "vpc-043572bdb0e1c8945"
}

variable "aws_region" {
  description = "Default Region"
  type        = string
  default     = "us-east-1"
}

variable "public_subnet" {
  description = "The public subnet to be used on EC2 Webserver instance"
  type = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type = string
}

variable "project_name" {
  description = "Default project name"
  type    = string
  default = "Aula 01"
}

variable "default_cidr_block" {
  description = "Default IPv4 outbound cidr block - 0.0.0.0/0"
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "image_id" {
  description = "EC2 Image ID"
  type        = string
}