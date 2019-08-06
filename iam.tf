# vim:ts=2:sw=2:et:

resource "aws_iam_role" "cluster" {
  name               = var.cluster_identifier
  assume_role_policy = data.aws_iam_policy_document.assume-role.json
  tags               = var.tags
}

data "aws_iam_policy_document" "assume-role" {
  statement {
    sid       = "AssumeRole"
    effect    = "Allow"
    actions   = [ "sts:AssumeRole" ]
    principals {
      type        = "Service"
      identifiers = [ "monitoring.rds.amazonaws.com" ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "cluster" {
  count = length(var.cluster_iam_policies)

  role       = aws_iam_role.cluster.name
  policy_arn = data.aws_iam_policy.cluster[count.index].arn
}

output "iam-role" {
  value = aws_iam_role.cluster
}

