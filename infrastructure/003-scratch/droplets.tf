# Create a new SSH key
resource "digitalocean_ssh_key" "scratch" {
  name       = "Terraform Example"
  public_key = file("~/.ssh/cka-exam-scratch.pub")
}


resource "digitalocean_droplet" "scratch-master" {
  image    = "ubuntu-24-04-x64"
  name     = "scratch-master"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  backups  = false
  ssh_keys = [
    digitalocean_ssh_key.scratch.id
  ]
}

resource "digitalocean_droplet" "scratch-worker" {
  image    = "ubuntu-24-04-x64"
  name     = "scratch-worker"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  backups  = false
  ssh_keys = [
    digitalocean_ssh_key.scratch.id
  ]
}