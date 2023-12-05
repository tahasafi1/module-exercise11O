variable "vpc_cidr" {
  type = string
}

variable "vpc_id" {
    type = string
    default = "vpc-009a52a757539185f"
}


variable "subnets" {
    type = map(object({
      cidr_block = string
      availability_zone_id = string
      }))
    #type = object({cidr_block = string})
    default = {}
}
