output "iam_instance_profile_arn" {
  value = aws_iam_instance_profile.iam_instance_profile.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.iam_policy.arn
}
