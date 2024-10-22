data "aws_iam_openid_connect_provider" "oidc" {
  url = var.provider_url
}

resource "aws_iam_openid_connect_provider" "oidc" {
  url = var.provider_url
  client_id_list = var.audiences
  thumbprint_list = data.aws_iam_openid_connect_provider.oidc.thumbprint_list
}

