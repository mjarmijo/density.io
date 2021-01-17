# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server1"

#bind_addr = "0.0.0.0" 
#bind_addr = "localhost"
bind_addr = "127.0.0.1"
# Enable the server
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1

    
    server_join {
      retry_join     = [ "1.1.1.1", "2.2.2.2" ]
      retry_max      = 3
      retry_interval = "15s"
    }
}

