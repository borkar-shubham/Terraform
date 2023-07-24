resource "google_storage_bucket" "static-site" {
  name          = format("%s-%s-bucket", var.project_name, var.env)
  location      = var.location
  storage_class = var.storage_class
  force_destroy = true

  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

#   website {
#     main_page_suffix = "index.html"
#     not_found_page   = "404.html"
#   }

#   cors {
#     origin          = ["http://image-store.com"]
#     method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
#     response_header = ["*"]
#     max_age_seconds = 3600
#   }
}