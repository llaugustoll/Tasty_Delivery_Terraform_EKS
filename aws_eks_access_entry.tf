resource "aws_eks_access_entry" "access" {
  cluster_name      = aws_eks_cluster.eks-tasty-delivery.name
  principal_arn     = var.principalArn
  kubernetes_groups = ["fiap", "grupo-15"]
  type              = "STANDARD"
}