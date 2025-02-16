variable DO_token {
  type = string 
  sensitive = true
}
variable DO_image {
  type = string 
  default = "ubuntu-20-04-x64"
}
variable DO_region {
  type = string 
  default = "sgp1"
}
variable DO_size {
  type = string 
  default = "s-1vcpu-1gb"
}

variable snapshot_name {
  type = string
  default = "mysnapshot"
}

variable code_server_archive {
   type = string
   default = "https://github.com/coder/code-server/releases/download/v4.22.1/code-server-4.22.1-linux-amd64.tar.gz"
}
variable unpacked_directory {
   type = string
   default = "code-server-4.22.1-linux-amd64"
}
