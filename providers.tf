terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.48.2"
    }
  }
}

provider "local" {
}

provider "digitalocean" {
  token = var.DO_key
}
