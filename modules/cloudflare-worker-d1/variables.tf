variable "account_id" {
  description = "ID de la cuenta de Cloudflare"
  type        = string
}

variable "worker_name" {
  description = "Nombre del Worker"
  type        = string
}

variable "d1_database_name" {
  description = "Nombre de la base de datos D1"
  type        = string
}

variable "compatibility_date" {
  description = "Fecha de compatibilidad del runtime de Workers"
  type        = string
  default     = "2026-09-16"
}

variable "enable_workers_dev" {
  description = "Publicar el Worker en el subdominio workers.dev"
  type        = bool
  default     = true
}
