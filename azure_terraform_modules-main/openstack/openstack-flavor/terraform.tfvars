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

