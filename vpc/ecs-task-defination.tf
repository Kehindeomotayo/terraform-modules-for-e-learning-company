#0. Create ECS Task Definition
resource "aws_ecs_task_definition" "task-definition" {
  family                   = local.task_def_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::${local.aws_account_id}:role/ecsTaskExecutionRole"
  memory                   = 4096
  cpu                      = 2048
  container_definitions = jsonencode([
    {

      name      = "${data.aws_ecr_image.image.image_tag}"
      image     = "${local.image_url}"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = local.container_port
          hostPort      = local.host_port
        }
      ]

    }
  ])

  tags = {
    Name = local.task_def_name
  }

}