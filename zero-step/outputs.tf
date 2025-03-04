#output "tfstate-bucket_access-key_" {
#  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#}
#output "tfstate-bucket_secret-key_" {
#  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#}

output "tfstate-bucket_access_key" {
  value = data.yandex_lockbox_secret_version.tfstate-bucket_version.entries[1].text_value
}
output "tfstate-bucket_secret_key" {
  value = data.yandex_lockbox_secret_version.tfstate-bucket_version.entries[0].text_value
}