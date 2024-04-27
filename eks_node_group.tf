resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.eks-tasty-delivery.name
  node_group_name = var.nodeGroupName
  node_role_arn   = var.arnRole
  subnet_ids      = [for subnet in data.aws_subnet.selected : subnet.id if subnet.availability_zone != "us-east-1e"]
  disk_size       = 30
  # instance_types  = ["t3.micro"]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.eks-tasty-delivery]
}