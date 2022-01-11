#-----------------------------------------------
# Output of Project
#-----------------------------------------------

output "project_id" {
  description = "Project ID"
  value = openstack_identity_project_v3.os_project_1.id
}

