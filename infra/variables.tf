variable "cloud_id" {
  type        = string
  default     = "b1guau0af4j7qkg1484e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gkg5og1lpl8fc1563m"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "k8s_networks" {
  type = list(object({
    zone = string
    cidr = string
  }))  
  default = [
    {
      zone = "ru-central1-a"
      cidr = "192.168.10.0/24"
    },
    {
      zone = "ru-central1-b"
      cidr = "192.168.20.0/24"
    },
    {
      zone = "ru-central1-d"
      cidr = "192.168.30.0/24"
    }
  ]
  description = "Networks for K8S cluster"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "VM image family"
}

variable "instance_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "VM platform ID"
}

variable "instance_resources_cores" {
  type        = number
  default     = 2
  description = "VM number of CPU"
}

variable "instance_resources_memory" {
  type        = number
  default     = 1
  description = "VM number of memory"
}

variable "instance_resources_core_fraction" {
  type        = number
  default     = 5
  description = "VM number of core fraction"
}

variable "cloud-init_file" {
  type        = string
  default     = "./metadata.yaml"
  description = "Cloud-init config"
}
