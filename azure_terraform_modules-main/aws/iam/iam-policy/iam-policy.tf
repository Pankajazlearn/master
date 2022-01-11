resource "aws_iam_policy" "policy" {
  name        = var.name
  path        = var.path
  description = var.description

  policy = var.policy

  tags = merge(
    local.common_tags,
    {
      Name        = var.name,
      Description = var.description
    }
  )
}
