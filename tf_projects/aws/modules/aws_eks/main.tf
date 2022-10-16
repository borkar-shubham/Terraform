//iam role for eks cluster
resource "aws_iam_role" "eksClusterRole" {
  name               = "eksClusterRole"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eksClusterRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# # Optionally, enable Security Groups for Pods
# # Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
# resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
#   role       = aws_iam_role.eksClusterRole.name
# }

resource "aws_eks_cluster" "tf_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eksClusterRole.arn

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = true
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    # aws_iam_role_policy_attachment.eksNodeGroupRole-AmazonEKSVPCResourceController,
  ]
}

#-------------------------------------------------------------------------------------------

//iam role for node group
resource "aws_iam_role" "eksNodeGroupRole" {
  name = "eksNodeGroupRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eksNodeGroupRole.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eksNodeGroupRole.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eksNodeGroupRole.name
}

//creating node group
resource "aws_eks_node_group" "eksNodeGroupRole" {
  cluster_name    = aws_eks_cluster.tf_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eksNodeGroupRole.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  # update_config {
  #   max_unavailable = 1
  # }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eksNodeGroupRole-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eksNodeGroupRole-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eksNodeGroupRole-AmazonEC2ContainerRegistryReadOnly,
  ]
}