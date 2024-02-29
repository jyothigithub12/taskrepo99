variable "vpc_cidr" {
  type        = string
  description = "default vpc_cidr_block"
  #default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "default vpc_cidr_block"
 # default     = "ap-south-1"
}

variable "environment" {
  type        = string
  description = "environment setup"
 # default     = "qa"
}

variable "product_name" {
  type        = string
  description = "default product_name"
 # default     = "oskill"
}

variable "pubsubnet_multiplier" {
  type        = number
 # default     = 4
}


variable "pvtsubnet_multiplier" {
  type        = number
 # default     = 4
}




variable "office_ips" {
  type    = list(string)
  default = ["103.183.203.82/32", "49.249.11.166/32", "49.249.13.16/29"]  # Replace x.x.x.x and y.y.y.y with your office IP addresses
}

variable "availability_zones" {
  type    = list(string)
  description = "List of availability zones"
 # default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}



