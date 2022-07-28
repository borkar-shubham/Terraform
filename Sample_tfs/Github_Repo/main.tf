resource "github_repository" "repo-terraform" {
    name = "repo_1"
    visibility = "private"
    auto_init = true
}