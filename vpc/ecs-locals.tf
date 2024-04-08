#2. Define The Local Variables for ECS
locals {
  task_def_name  = "${var.project_name}-task-definition"
  aws_account_id = data.aws_caller_identity.current.account_id
  image_url      = "${local.aws_account_id}.dkr.ecr.${var.region}.amazonaws.com/${data.aws_ecr_image.image.repository_name}:${data.aws_ecr_image.image.image_tag}"
  container_port = 80
  host_port      = 80
  alb_name       = "${var.project_name}-load-balancer"
  service_name   = "${var.project_name}-service"
  cluster_name   = "${var.project_name}-cluster"
}