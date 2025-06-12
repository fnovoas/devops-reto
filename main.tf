# main.tf — módulo raíz

terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

# Variables del módulo raíz
variable "pat" {
  description = "PAT con scope write:packages para GHCR"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Usuario de GHCR"
  type        = string
}

# Invocación del submódulo
module "docker_push" {
  source     = "./modules/docker_push"
  image_name = "devops-reto"
  image_tag  = "latest"
  registry   = "ghcr.io/fnovoas"
  username   = var.username
  pat        = var.pat
}
