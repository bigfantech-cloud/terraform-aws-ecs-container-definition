
#----
#CONTAINER DEFENITION
#----
variable "container_name" {
  description = "Name of the container"
  type        = string

}
variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "container_memory" {
  description = "The amount (in MiB) of memory to present to the container. If your container attempts to exceed the memory specified here, the container is killed."
  type        = number
  default     = null
}

variable "container_memory_reservation" {
  description = <<-EOF
  "The soft limit memory (in MiB) to reserve for the container.
  When system memory is under contention, Docker attempts to keep the container memory to this soft limit"
  EOF
  type        = number
  default     = null
}

variable "container_cpu_units" {
  description = <<-EOF
  "The number of cpu units to reserve for the container"
  EOF
  type        = number
  default     = null
}

variable "port_mappings" {
  description = "List of container port mapping config map containing `name` (optional), `ConatinerPort`, `Protocol` (optional), `appProtocol` (optional)  "
  type = list(object({
    name          = optional(string)
    containerPort = number
    protocol      = optional(string)
    appProtocol   = optional(string)
  }))
  default = []
}

variable "container_env_vars" {
  description = "List of map containing environment secrets `name`, `value`"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "container_secrets" {
  description = "List of map containing environment secrets `name`, `valueFrom`"
  type = list(object({
    name      = string
    valueFrom = string
  }))
  default = []
}

variable "essential" {
  description = <<-EOF
If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped.
If the essential parameter of a container is marked as false, its failure doesn't affect the rest of the containers in a task.

If this parameter is omitted, a container is assumed to be essential.
All tasks must have at least one essential container.
EOF
  default     = false
}

variable "command" {
  description = "The command that's passed to the container"
  type        = list(string)
  default     = null
}

variable "stoptimeout" {
  description = "time, in seconds, that the Amazon ECS service scheduler should ignore the task when it is being taken down"
  type        = number
  default     = 120
}
