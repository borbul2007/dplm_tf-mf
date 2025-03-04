resource "yandex_iam_service_account" "sa" {
  name        = "infra-editor"
  description = "Service account for managing infrastructure"
}
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id  = var.folder_id
  role       = "editor"
  member     = "serviceAccount:${yandex_iam_service_account.sa.id}"
}
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for object storage"
  output_to_lockbox {
    secret_id            = yandex_lockbox_secret.tfstate-bucket.id
    entry_for_access_key = "access_key"
    entry_for_secret_key = "secret_key"
  }
}
data "yandex_bucket_keys" "tfstate-bucket-keys" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}


resource "yandex_lockbox_secret" "tfstate-bucket" {
  name                = "tfstate-bucket"
  deletion_protection = false
}
data "yandex_lockbox_secret_version" "tfstate-bucket_version" {
  secret_id  = yandex_lockbox_secret.tfstate-bucket.id
  version_id = yandex_iam_service_account_static_access_key.sa-static-key.output_to_lockbox_version_id
  depends_on = [yandex_lockbox_secret.tfstate-bucket]
}
