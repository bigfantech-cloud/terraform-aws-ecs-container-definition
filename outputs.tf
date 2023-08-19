output "cd_json" {
  description = "Json encoded Single Container Defenition as list"
  value       = [local.cd_json]
}

output "cd_json_object" {
  description = "Map of Container Defenition objects"
  value       = jsondecode(local.cd_json)
}

output "port_mappings" {
  description = "List of Container port mappings"
  value       = local.container_definition.portMappings
}
