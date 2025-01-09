# Create a new SSH key
resource "digitalocean_ssh_key" "kubeadm" {
  name       = "Terraform Example"
  public_key = file("~/.ssh/cka-exam-kubeadm.pub")
}


resource "digitalocean_droplet" "kubeadm-master" {
  image    = "ubuntu-24-04-x64"
  name     = "kubeadm-master"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  backups  = false
  ssh_keys = [
    digitalocean_ssh_key.kubeadm.id
  ]
}

resource "digitalocean_droplet" "kubeadm-worker" {
  image    = "ubuntu-24-04-x64"
  name     = "kubeadm-worker"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  backups  = false
  ssh_keys = [
    digitalocean_ssh_key.kubeadm.id
  ]
}