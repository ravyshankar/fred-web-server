variable "DO_key" {
    type = string
    description = "DO Key"
    default = "set this"
    sensitive = true
}

variable "public_key_name" {
    type = string
    default = "ravi-digital-ocean"
}

variable "droplet_size" {
    type = string
    default ="	s-1vcpu-1gb"
}

variable "droplet_image" {
    type = string
    default = "ubuntu-24-04-x64"
}

variable "droplet_region" {
    type = string
    default = "sgp1"
}

variable "ssh_keys" {
    type = string
    default = "workshop01"
}

variable "public_key" {
    type = string
}

variable "private_key" {
    type = string
}
