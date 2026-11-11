# Practica 12 - Practica 11 refactorizada en modulos.
# La raiz solo configura el provider y llama al modulo, que contiene
# la base D1, el Worker y su subdominio workers.dev.
module "worker_d1" {
  source = "./modules/cloudflare-worker-d1"

  account_id         = var.account_id
  worker_name        = var.worker_name
  d1_database_name   = var.d1_database_name
  compatibility_date = "2026-09-16"
}
