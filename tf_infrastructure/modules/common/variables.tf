variable resource_group_name {}
variable location {}
variable environment {}

locals {

  resource_group_name = "${var.resource_group_name}-${var.environment}"
}