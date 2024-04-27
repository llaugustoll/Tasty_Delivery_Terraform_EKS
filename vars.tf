variable "regionDefault" {
  default = "us-east-1"
}

variable "eksName" {
  default = "eks-tasty"
}

variable "eksVersion" {
  default = "1.29"
}

variable "arnRole" {
  default = "arn:aws:iam::441687213051:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::441687213051:role/voclabs"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "serviceIpv4" {
  default = "10.100.0.0/16"
}

variable "nodeGroupName" {
  default = "tasty-node"
}

variable "nodeDiskSize" {
  default = 20
}

variable "nodeInstanceType" {
  default = "c3.xlarge"
}

variable "nodeCapacityType" {
  default = "ON_DEMAND"
}

variable "nodeAmiType" {
  default = "AL2_x86_64"
}

variable "ebsAddonName" {
  default = "aws-ebs-csi-driver"
}

variable "ebsAddonVersion" {
  default = "v1.28.0-eksbuild.1"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "sgId" {
  default = "sg-000539e3f22184bcf"
}

variable "tags" {
  type = map(string)
  default = {
    App      = "tastyDelivery",
    Ambiente = "Desenvolvimento"
  }
}