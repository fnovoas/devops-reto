terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

# Etiqueta y push de la imagen Docker
resource "null_resource" "docker_push" {
  triggers = {
    image = "${var.registry}/${var.image_name}:${var.image_tag}"
  }

  provisioner "local-exec" {
  command = <<EOT
    echo "${var.pat}" | docker login ghcr.io -u ${var.username} --password-stdin
    docker tag ${var.image_name}:${var.image_tag} \
      ${var.registry}/${var.image_name}:${var.image_tag}
    docker push ${var.registry}/${var.image_name}:${var.image_tag}
  EOT

  environment = {
    pat      = var.pat
    username = var.username
  }
 }
}