resource "github_repository" "tf_repo" {
  name       = "repo_1"
  visibility = "private"
  auto_init  = true
}

output "repo_url" {
  value = github_repository.tf_repo.html_url
}
