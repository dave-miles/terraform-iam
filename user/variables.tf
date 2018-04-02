variable "user_names" {
  type = "list"
}

variable "pgp_key" {
  description = "(Required) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username"
}

variable "user_path" {
  type = "string"
  default = "/"
}

variable "force_destroy" {
  type = "string"
  default = "false"
}
