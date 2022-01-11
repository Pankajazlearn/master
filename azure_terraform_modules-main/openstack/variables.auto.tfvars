networklist = {
  network1 = {
    name    = "network_test1"
    subnets = { name = "subnet_test1", subnet = "20.11.1.1/23" }
  },
  network2 = {
    name    = "network_test2"
    subnets = { name = "subnet_test2", subnet = "20.11.1.1/22" }
  }
}

project_name = "project01"

description  = "A V3 Project resource within OpenStack Keystone"

domain_id    = "xxxxxxxxxxxxxxxxx"

enabled      = true

is_domain    = true

parent_id    = "xxxxxxxxxxxxxxxxx"

region       = "UAE North"

environment  = "dev"

user_name = "admin"

description = "A user"

password = "password123"

ignore_change_password_upon_first_use = true

multi_factor_auth_enabled = true

mfa_rule = "password"

email = demo@example.com

falvorlist = {
     falvor1= {
        name = "falvor_test1"
        vcpu = 1
        ram  = 1
        disk = 1
        extra_specs={}
    },
     falvor2= {
        name = "falvor_test2"
        vcpu = 2
        ram  = 2
        disk = 2
        extra_specs={
          "hw:cpu_policy"        = "CPU-POLICY",
          "hw:cpu_thread_policy" = "CPU-THREAD-POLICY"}
     }
}

image_list = {
    image1= {
        name = "image_test1"
        image_source_url= "image/rancheros-openstack.img"
    },
    matt_test_two = {
        name ="image_test2"
        image_source_url = "image/rancheros-openstack.img"
    }
}

