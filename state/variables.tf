variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "state-bucket-name" {
  type    = string
  default = "william-arslett-terraform-state-bucket-1"
}

variable "state-lock-table" {
  type    = string
  default = "terraform-state-lock"
}
