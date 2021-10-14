locals {
  name_prefix = substr("irsa-${var.cluster_name}", 0, 32)
}

resource "aws_iam_policy" "policy" {
  name_prefix = local.name_prefix
  description = "Auto-generated IRSA ${var.cluster_name}"
  policy      = jsonencode(jsondecode(file(abspath(pathexpand(var.policy_file)))))
}

module "irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 4.2"

  create_role                   = true
  role_name_prefix              = local.name_prefix
  provider_url                  = var.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"]
}
