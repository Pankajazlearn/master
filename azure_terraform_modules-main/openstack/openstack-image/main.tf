##--------------
## create of image
##--------------

resource "openstack_images_image_v2" "vm_image" {
  for_each         = var.image_list
  name             = each.value["name"]
  image_source_url = each.value["image_source_url"]
  container_format = "bare"
  disk_format      = "qcow2"

}
