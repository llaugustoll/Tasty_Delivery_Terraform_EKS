resource "aws_eks_cluster" "eks-tasty-delivery" {
  # kubernetes_network_config {
  #   ip_family         = "ipv4"
  #   service_ipv4_cidr = var.serviceIpv4
  # }

  name     = var.eksName
  role_arn = var.arnRole
  # role_arn = data.aws_iam_role.name.arn
  # version  = var.eksVersion

  vpc_config {
    # endpoint_private_access = "true"
    # endpoint_public_access  = "true"
    # public_access_cidrs     = ["0.0.0.0/0"]
    subnet_ids         = [for subnet in data.aws_subnet.selected : subnet.id if subnet.availability_zone != "us-east-1e"]
    security_group_ids = ["${var.sgId}"]
  }

  access_config {
    authentication_mode = var.accessConfig
  }

}

resource "aws_security_group_rule" "allow_eks_to_rds" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.rds.outputs.security_group_id
  source_security_group_id = data.aws_security_group.eks-sg.id
}


# resource "aws_eks_addon" "aws_ebs_csi_driver" {
#   cluster_name                = var.eksName
#   addon_name                  = var.ebsAddonName
#   addon_version               = var.ebsAddonVersion
#   resolve_conflicts_on_create = "NONE"
#   resolve_conflicts_on_update = "NONE"

#   depends_on = [aws_eks_node_group.techlanches-node]
# }

# resource "aws_security_group" "eks-sg" {
#   name        = "eks-default-sg"
#   description = "Default security group for the EKS cluster"
#   vpc_id      = aws_eks_cluster.eks-tasty-delivery.vpc_config[0].vpc_id
# }

# resource "aws_eks_addon" "vpc_cni" {
#   cluster_name                = var.eksName
#   addon_name                  = "vpc-cni"
#   addon_version               = "v1.16.0-eksbuild.1"
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   depends_on = [aws_eks_node_group.techlanches-node]
# }

# resource "aws_eks_addon" "kube_proxy" {
#   cluster_name                = var.eksName
#   addon_name                  = "kube-proxy"
#   addon_version               = "v1.29.0-eksbuild.1"
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   depends_on = [
#     aws_eks_addon.vpc_cni
#   ]
# }

# resource "aws_eks_addon" "core_dns" {
#   cluster_name                = var.eksName
#   addon_name                  = "coredns"
#   addon_version               = "v1.11.1-eksbuild.4"
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"

#   depends_on = [
#     aws_eks_addon.vpc_cni
#   ]
# }