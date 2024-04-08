#0. Create ECS Autoscale Role

resource "aws_iam_role" "ecs-autoscale-role" {
  name = "${var.project_name}-ecsAutoscaleRole"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "application-autoscaling.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "ecs-autoscale-role-policy-attachment" {
  role = aws_iam_role.ecs-autoscale-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole"
}