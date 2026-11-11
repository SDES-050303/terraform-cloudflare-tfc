# Base de datos D1
resource "cloudflare_d1_database" "this" {
  account_id = var.account_id
  name       = var.d1_database_name

  read_replication = {
    mode = "disabled"
  }
}

# Worker que responde GET, enlazado a la base D1 como "DB"
resource "cloudflare_workers_script" "this" {
  account_id         = var.account_id
  script_name        = var.worker_name
  main_module        = "worker.js"
  content_file       = "${path.module}/src/worker.js"
  content_sha256     = filesha256("${path.module}/src/worker.js")
  compatibility_date = var.compatibility_date

  bindings = [
    {
      name        = "DB"
      type        = "d1"
      database_id = cloudflare_d1_database.this.id
    }
  ]
}

# Subdominio workers.dev del Worker
resource "cloudflare_workers_script_subdomain" "this" {
  account_id       = var.account_id
  script_name      = cloudflare_workers_script.this.script_name
  enabled          = var.enable_workers_dev
  previews_enabled = false
}
