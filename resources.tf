resource "digitalocean_ssh_key" "workshop01" {
    name = "workshop01"
    public_key = file(var.public_key)
}

resource "digitalocean_droplet" "nginx" {
    name = "nginx"
    image = var.droplet_image
    size = var.droplet_size
    region = var.droplet_region
    ssh_keys = [ digitalocean_ssh_key.workshop01.id ]

    connection {
    type = "ssh"
    user = "root"
    private_key = file(var.private_key)
    host = self.ipv4_address
    }

    provisioner "remote-exec" {
        inline = [
            "apt update",
            "apt install -y nginx",
            "systemctl start nginx",
            "systemctl enable nginx"

        ]
    }
    provisioner file {
        source = "/root/terraform/nginx/assets/"
        destination = "/var/www/html/"
    }
}

resource "local_file" "index_html" {
    filename = "/root/terraform/nginx/assets/index.html"
    file_permission = "0644"
    content = templatefile("/root/terraform/nginx/assets/index.html.tftpl", {
        droplet_ip = digitalocean_droplet.nginx.ipv4_address
    }
    )
}

resource "local_file" "nginx_dns" {
    filename = "nginx-${digitalocean_droplet.nginx.ipv4_address}.nip.io"
    content = ""
    file_permission = "0444"
}

output "coursekey_fingerprint" {
    description = "Fingerprint of public key"
    value = digitalocean_ssh_key.workshop01.fingerprint
}

output "nginx_ip" {
    description = "ip of nginx"
    value = digitalocean_droplet.nginx.ipv4_address
}