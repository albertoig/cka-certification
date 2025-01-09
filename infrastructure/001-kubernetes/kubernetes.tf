data "digitalocean_kubernetes_versions" "example" {
  version_prefix = "1.30."
}

resource "digitalocean_kubernetes_cluster" "cka" {
  name         = "cka-exam"
  # REGIONS: https://docs.digitalocean.com/platform/regional-availability/
  region       = "nyc1" # New York
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.example.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 3
    tags = [
        "CKA-EXAM"
    ]
  }

  destroy_all_associated_resources = true
}
