resource "aws_iam_openid_connect_provider" "oidc" {
  url = var.provider_url
  client_id_list = [ var.audience ]
  thumbprint_list = [ var.provider_thumbprint ]
}

# Fetch managed permission policy
data "aws_iam_policy" "ecr_power_user" {
  name = "AmazonEC2ContainerRegistryPowerUser"
}

# Describe the trust entity
data "aws_iam_policy_document" "assume_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Federated"
      identifiers = [ aws_iam_openid_connect_provider.oidc.arn ]
    }
    actions = [ "sts:AssumeRoleWithWebIdentity" ]
    condition {
      test = "StringEquals"
      variable = "${var.provider_url}:aud"

      values = [ var.audience ]
    }
    condition {
      test = "StringLike"
      variable = "${var.provider_url}:aud"

      values = [ "repo:${var.repo_name}:*" ]
    }
  }
}

# Assign permission policy to trust entity
resource "aws_iam_role" "remote_sts_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
  managed_policy_arns = [ data.aws_iam_policy.ecr_power_user.arn ]
}