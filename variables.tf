variable "container_name" {
  description = "Value of the number of the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}

variable "port_external" {
  description = "port number outside container"
  type        = number
  default     = 8080
}
