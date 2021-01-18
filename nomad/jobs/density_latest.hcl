job "density" {
  datacenters = ["dc1"]
  type = "service"
 ## constraint {
  #   attribute = "${attr.kernel.name}"
  #   value     = "linux"
  # }
  migrate {
    # Specifies the mechanism in which allocations health is determined. The
    # potential values are "checks" or "task_states".
    health_check = "task_states"
  }
  group "density-group" {
    count = 1
    network {
      port "app-a" {
#        to = 5000 # dynamically assings localhost port 
        static = 5000
        to     = 5000
      }
      port "app-b" {
#        to = 5000 # dynamically assings localhost port 
        static = 5001
        to     = 5001
      }
    }
    service {
      name = "app-a"
      tags = ["global", "density", "app-a"]
      port = "app-a"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    service {
      name = "app-b"
      tags = ["global", "density", "app-b"]
      port = "app-b"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    task "app-a" {
      driver = "docker"

      config {
        image = "mjarmijo/app_a:latest"
   #     network_mode = "bridge"

     #   ports = ["app-a-port"]
        ports = ["app-a"]

        command = "python3"
        args = [
          "app_a.py"
        ]

      }
      env {
        NOMAD_ADDR_app-b = "${NOMAD_ADDR_app-b}"
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
    task "app-b" {
      driver = "docker"

      config {
        image = "mjarmijo/app_b:latest"
   #     network_mode = "bridge"

     #   ports = ["app-b-port"]
        ports = ["app-b"]

        command = "python3"
        args = [
          "app_b.py"
        ]

      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
  }
}