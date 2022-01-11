##------------------
## output of image
##------------------
output "image_checksum" {
  description = "image checksum"
  value ={for key, value in openstack_images_image_v2.vm_image: value.name=> value.checksum}
}
