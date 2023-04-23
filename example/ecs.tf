module "app_container_definition" {
  source  = "bigfantech-cloud/ecs-container-definition/aws"
  version = "1.0.0"

  project_name      = "abc"
  container_name    = "server"
  container_image   = "httpd:2.4"
  essential         = true
  cd_awslogs_region = "us-east-1"

  port_mappings = [
    {
      "containerPort" = 80
      "protocol"      = "tcp"
    }
  ]
  container_env_vars = [
    {
      name  = "key"
      value = "value"
    },
  ]
  container_secrets = [
    {
      name      = "key"
      valueFrom = "ssm_parameter_name"
    },
  ]
}

module "ecs-td-service" {
  source = "bigfantech-cloud/ecs-task-definition-service/aws"

  #...
  #..... other attributes
  container_definitions = [module.app_container_definition.cd_json_object]

}
