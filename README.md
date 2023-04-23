# BigFantech-Cloud

We automate your infrastructure.
You will have full control of your infrastructure, including Infrastructure as Code (IaC).

To hire, email: `bigfantech@yahoo.com`

# Purpose of this code

> Terraform module

- To generate ECS Container Definition as JSON object.
- Setup CloudWatch log group

## Variables

### Required Variables

| Name                | Description                                                                                                                                                                                                                                                                                                            |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `project_name`      |                                                                                                                                                                                                                                                                                                                        |
| `environment`       |                                                                                                                                                                                                                                                                                                                        |
| `container_name`    | Name of the container                                                                                                                                                                                                                                                                                                  |
| `container_image`   | DockerImage URI                                                                                                                                                                                                                                                                                                        |
| `cd_awslogs_region` | ECS log creation region. (example: us-east-1)                                                                                                                                                                                                                                                                          |
| `port_mappings`     | List of map containing `ConatinerPort`, `Protocol`                                                                                                                                                                                                                                                                     |
| `essential`         | If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped. If this parameter is omitted, a container is assumed to be essential. All tasks must have at least one essential container. Default = false |

### Optional Variables

| Name                           | Description                                                                                                                                                                         |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                |                                                                                                                                                                                     |
| `container_env_vars`           | List of map containing environment variable "name" "value"                                                                                                                          |
| `container_secrets`            | List of map containing environment secrets "name" "valueFrom"                                                                                                                       |
| `container_memory`             | Container Hard memory limit (example: 512). Default = null                                                                                                                          |
| `container_memory_reservation` | The soft limit memory (in MiB) to reserve for the container.When system memory is under contention, Docker attempts to keep the container memory to this soft limit. Default = null |
| `container_cpu_units`          | The number of cpu units to reserve for the container. A container instance has 1,024 cpu units for every CPU core                                                                   |
| `command`                      | Command to add in Conatiner Definition                                                                                                                                              |
| `stoptimeout`                  | Time, in seconds, that the Amazon ECS service scheduler should ignore the task when it is being taken down. Default = 120                                                           |

### Example config

> Check the `example` folder in this repo

### Outputs

| Name             | Description                                      |
| ---------------- | ------------------------------------------------ |
| `cd_json`        | Json encoded Single Container Defenition as list |
| `cd_json_object` | Map of Container Defenition objects              |
