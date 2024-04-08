resource "aws_ecs_service" "service" {
  name                               = local.service_name
  cluster                            = aws_ecs_cluster.cluster.id
  task_definition                    = aws_ecs_task_definition.task-definition.arn
  desired_count                      = 4
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  platform_version                   = "LATEST"
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  network_configuration {
    security_groups  = ["${aws_security_group.sg.id}"]
    subnets          = [aws_subnet.private-subnets[0].id, aws_subnet.private-subnets[1].id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.lb-target-group.arn
    container_name    = data.aws_ecr_image.image.image_tag
    container_port    = local.container_port
  }
}