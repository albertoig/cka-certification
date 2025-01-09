output "master_public_ip" {
  value = digitalocean_droplet.kubeadm-master.ipv4_address
}

output "worker_public_ip" {
  value = digitalocean_droplet.kubeadm-worker.ipv4_address
}
