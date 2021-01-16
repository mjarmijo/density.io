job "app-a-job" {
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
  group "app-a-group" {
    count = 1
    network {
      port "app-a-port" {
        to = 5000
      }
    }
    service {
      name = "app-a-service"
      tags = ["global", "density", "app-a"]
      port = "app-a-port"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    task "app-a-task" {
      driver = "docker"

      config {
        image = "redis:4.0"
        ports = ["db"]
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
  }
}
