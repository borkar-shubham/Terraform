variable "cluster_name" {
  type = number
  default = "test_eks_cluster"
}

variable "node_group_name" {
  type = number
  default = "test_node_group"
}

variable "subnet_ids" {
  type    = list(number)
  default = ["subnet-09ee3c60a8c5c773c", "subnet-03989839a45cc5495"]
}

variable "desired_size" {
  type = number
  default = 1
}

variable "max_size" {
  type = number
  default = 2
}

variable "min_size" {
  type = number
  default = 1
}