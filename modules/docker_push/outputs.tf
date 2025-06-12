output "full_image" {
  value = "${var.registry}/${var.image_name}:${var.image_tag}"
  description = "Imagen completa empujada al registry."
}
