variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "cidr_0" {
  description = "The CIDR Block with value '0.0.0.0/0'"
  type        = string
  default     = "0.0.0.0/0"
}