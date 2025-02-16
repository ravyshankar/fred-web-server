terraform {
  required_version = "> 1.7.0"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.36.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

provider digitalocean {
   token = var.DO_token
}

provider local { }