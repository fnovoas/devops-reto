variable "image_name" {
  description = "Nombre local de la imagen Docker (sin registry)."
  type        = string
}

variable "image_tag" {
  description = "Etiqueta de la imagen Docker."
  type        = string
  default     = "latest"
}

variable "registry" {
  description = "URL del registry (ej: ghcr.io/usuario)."
  type        = string
}

variable "username" {
  description = "Usuario de GHCR"
  type        = string
}

variable "pat" {
  description = "PAT con scope write:packages para GHCR"
  type        = string
  sensitive   = true
}
