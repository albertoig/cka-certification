output "master_public_ip" {
  value = digitalocean_droplet.scratch-master.ipv4_address
}

output "worker_public_ip" {
  value = digitalocean_droplet.scratch-worker.ipv4_address
}
