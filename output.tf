output "admin_host" {
  value = module.aks.admin_host
  sensitive = true
}
output "admin_username" {
  value = module.aks.admin_username
  sensitive = true
}

output "aks_id" {
  value = module.aks.aks_id
  sensitive = false
}

output "location" {
  value = module.aks.location
  sensitive = false
}
