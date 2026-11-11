output "worker_name" {
  description = "Nombre del Worker desplegado"
  value       = cloudflare_workers_script.this.script_name
}

output "d1_database_id" {
  description = "UUID de la base de datos D1"
  value       = cloudflare_d1_database.this.id
}

output "workers_dev_enabled" {
  description = "Si el Worker esta publicado en workers.dev"
  value       = cloudflare_workers_script_subdomain.this.enabled
}
