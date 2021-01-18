#https://releases.hashicorp.com/consul/1.9.1/consul_1.9.1_linux_amd64.zip

#"client_addr":"0.0.0.0",


job "consul" {
  datacenters = ["dc1"]
  type = "service"

  group "consul" {
    count = 1
#    network {
#      port "consul" {
##        to = 5000 # dynamically assings localhost port 
#        static = 5002
#        to     = 5001
#      }
#    }
    service {
      name = "consul"
      tags = ["global", "density", "consul"]
      #port = "consul"
      # check {
      #   name     = "alive"
      #   type     = "tcp"
      #   interval = "10s"
      #   timeout  = "2s"
      # }
    }
    task "consul" {
      driver = "raw_exec"

      config {
     #   ports = ["app-b-port"]
     #   ports = ["app-b"]

        command = "consul"
        args = [
          "agent",
          "-dev"
        ]

      }
      artifact {
          source = "https://releases.hashicorp.com/consul/1.9.1/consul_1.9.1_linux_amd64.zip"
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
  }
}

