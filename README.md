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

| Name              | Description           | Type   | Default |
| ----------------- | --------------------- | ------ | ------- |
| `project_name`    |                       |        |         |
| `environment`     |                       |        |         |
| `container_name`  | Name of the container | string |         |
| `container_image` | DockerImage URI       | string |         |

### Optional Variables

| Name                           | Description                                                                                                                                                                                                                                                                                               | Type                                                                                                                                       | Default |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `port_mappings`                | List of container port mapping config map containing `name` (optional), `ConatinerPort`, `Protocol` (optional), `appProtocol` (optional)                                                                                                                                                                  | list(object({<br>name = optional(string)<br>containerPort = number<br>protocol = optional(string)<br>appProtocol = optional(string)<br>})) | []      |
| `essential`                    | If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped.<br>If this parameter is omitted, a container is assumed to be essential. All tasks must have at least one essential container. | bool                                                                                                                                       | false   |
| `container_env_vars`           | List of map containing environment secrets `name`, `value`                                                                                                                                                                                                                                                | list(object({<br>name = string<br>value = string<br>}))                                                                                    | []      |
| `container_secrets`            | List of map containing environment secrets `name`, `valueFrom`                                                                                                                                                                                                                                            | list(object({<br>name = string<br>valueFrom = string<br>}))                                                                                | []      |
| `container_memory`             | The amount (in MiB) of memory to present to the container. If your container attempts to exceed the memory specified here, the container is killed.                                                                                                                                                       | number                                                                                                                                     | null    |
| `container_memory_reservation` | The soft limit memory (in MiB) to reserve for the container. When system memory is under contention, Docker attempts to keep the container memory to this soft limit.                                                                                                                                     | number                                                                                                                                     | null    |
| `container_cpu_units`          | The number of cpu units to reserve for the container                                                                                                                                                                                                                                                      | number                                                                                                                                     | null    |
| `command`                      | The command that's passed to the container.                                                                                                                                                                                                                                                               | list(string)                                                                                                                               | null    |
| `stoptimeout`                  | Time, in seconds, that the Amazon ECS service scheduler should ignore the task when it is being taken down.                                                                                                                                                                                               | number                                                                                                                                     | 120     |

### Example config

> Check the `example` folder in this repo

### Outputs

| Name             | Description                                      |
| ---------------- | ------------------------------------------------ |
| `cd_json`        | Json encoded Single Container Defenition as list |
| `cd_json_object` | Map of Container Defenition objects              |
| `port_mappings`  | List of Container port mappings                  |
