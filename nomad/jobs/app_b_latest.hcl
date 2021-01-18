job "app-b" {
  datacenters = ["dc1"]
  type = "service"
  # constraint {
  #   attribute = "${attr.kernel.name}"
  #   value     = "linux"
  # }
  migrate {
    # Specifies the mechanism in which allocations health is determined. The
    # potential values are "checks" or "task_states".
    health_check = "task_states"
  }
  group "app-b" {
    count = 1
    network {
      port "app-b" {
#        to = 5000 # dynamically assings localhost port 
        static = 5001
        to     = 5001
      }
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
    task "app-b" {
      driver = "docker"

      config {
        image = "mjarmijo/app_b:latest"
        network_mode = "bridge"

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
