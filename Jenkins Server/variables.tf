variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnets CIDR"
  type        = list(string)
}

#variable "private_subnets" {
#  description = "Subnets CIDR"
#  type        = list(string)
#}

variable "instance_type" {
  description = "instance type"
  type        = string
}