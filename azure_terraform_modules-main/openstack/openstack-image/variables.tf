
variable "image_list" {
  type = map(object({
  name = string
  image_source_url = string
  }))
}
