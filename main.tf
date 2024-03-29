data "aws_region" "current" {}

locals {
  container_definition = {
    name               = var.container_name
    image              = var.container_image
    memory             = var.container_memory
    memory_reservation = var.container_memory_reservation
    cpu                = var.container_cpu_units
    essential          = var.essential
    command            = var.command
    stopTimeout        = var.stoptimeout

    portMappings = [for map in var.port_mappings : {
      name          = coalesce(map.name, var.container_name)
      containerPort = map.containerPort
      protocol      = coalesce(map.protocol, "tcp")
      appProtocol   = coalesce(map.appProtocol, "http")
    }]
    environment = var.container_env_vars != [] ? local.sorted_environment_vars : []
    secrets     = var.container_secrets != [] ? local.sorted_secrets_vars : []

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"
        awslogs-group         = "/ecs/${module.this.id}/${var.container_name}"
        awslogs-region        = data.aws_region.current.name
        awslogs-stream-prefix = "ecs"
      }
    }
  }

  cd_json = jsonencode(local.container_definition)


  #----
  #ENVIRONMENT VARIABLE
  #ENVIRONMENT SECRETS
  #----

  env_vars_keys        = var.container_env_vars != null ? [for m in var.container_env_vars : lookup(m, "name")] : []
  env_vars_values      = var.container_env_vars != null ? [for m in var.container_env_vars : lookup(m, "value")] : []
  env_vars_as_map      = zipmap(local.env_vars_keys, local.env_vars_values)
  sorted_env_vars_keys = sort(local.env_vars_keys)

  sorted_environment_vars = [
    for key in local.sorted_env_vars_keys :
    {
      name  = key
      value = lookup(local.env_vars_as_map, key)
    }
  ]

  secrets_keys        = var.container_secrets != null ? [for n in var.container_secrets : lookup(n, "name")] : []
  secrets_values      = var.container_secrets != null ? [for n in var.container_secrets : lookup(n, "valueFrom")] : []
  secrets_as_map      = zipmap(local.secrets_keys, local.secrets_values)
  sorted_secrets_keys = sort(local.secrets_keys)

  sorted_secrets_vars = [
    for key in local.sorted_secrets_keys :
    {
      name      = key
      valueFrom = lookup(local.secrets_as_map, key)
    }
  ]
}
