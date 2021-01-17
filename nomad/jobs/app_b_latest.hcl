job "app-b-job" {
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
  group "app-b-group" {
    count = 1
    network {
      port "app-b-port" {
#        to = 5000 # dynamically assings localhost port 
        static = 5001
        to     = 5001
      }
    }
    service {
      name = "app-b-service"
      tags = ["global", "density", "app-b"]
      port = "app-b-port"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    task "app-b-task" {
      driver = "docker"

      config {
        image = "mjarmijo/app_b:latest"
     #   ports = ["app-b-port"]
        ports = ["app-b-port"]

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
