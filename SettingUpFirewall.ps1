# In virtual machine


# Open firewall port 2375
netsh advfirewall firewall add rule name="docker engine" dir=in action=allow protocol=TCP localport=2375

# Configure Docker daemon to listen on both pipe and TCP (replaces docker --register-service invocation above)
Stop-Service docker
dockerd --unregister-service
dockerd -H npipe:// -H 0.0.0.0:2375 --register-service
Start-Service docker
