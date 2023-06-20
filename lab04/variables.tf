variable "environment" {
  type    = string
  default = "dev"
}

variable "roles" {
  type    = set(string)
  default = ["Tech Lead", "FE Developer", "BE Developer", "DevOps"]
}

variable "regions_in_AWS" {
  type = map(string)
  default = {
    "USA"    = "us-east-1"
    "Europe" = "eu-central-1"
    "Asia"   = "ap-east-1"
  }
}
