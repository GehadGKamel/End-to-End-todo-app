data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_role" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "EKS_Cluster_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "EKS_VPC_Resource_Controller" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_role.name
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my_cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.public.id, aws_subnet.private_1.id, aws_subnet.private_2.id] # 
    endpoint_public_access = true
  }


  depends_on = [
    aws_iam_role_policy_attachment.EKS_Cluster_Policy,
    aws_iam_role_policy_attachment.EKS_VPC_Resource_Controller,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.my_cluster.certificate_authority[0].data
}
