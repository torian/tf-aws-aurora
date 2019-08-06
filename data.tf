# vim:ts=2:sw=2:et:

data "aws_iam_policy" "cluster" {
  count = length(var.cluster_iam_policies)
  arn   = "arn:aws:iam::aws:policy/service-role/${element(var.cluster_iam_policies, count.index)}"
}

