resource "github_repository" "repo-terraform" {
    name = "repo_1"
    visibility = "private"
    auto_init = true
}

output "repo_url" {
    value = github_repository.repo-terraform.html_url
}
