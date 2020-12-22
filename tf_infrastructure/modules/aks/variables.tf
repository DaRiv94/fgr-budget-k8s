variable environment {}
variable location {}
variable resource_group_name {}

#for service principal
variable "client_secret" {
  type        = string
  description = "The password for this user"
}

variable "client_id" {
  type        = string
  description = "The user name"
}


variable auto_scaling_max_count {
  type        = map(number)
  description = "Max count for autoscaling"
  default = {
    dev = 1
    #qa  = 1
    #prd = 5
  }
}

variable auto_scaling_min_count {
  type        = map(number)
  description = "Min count for autoscaling"
  default = {
    dev = 1
    #qa  = 1
    #prd = 5
  }
}

variable auto_scaling_default_node_count {
  type        = map(number)
  description = "Default node count"
  default = {
    dev = 1
    #qa  = 1
    #prd = 3
  }
}