#Create ECS auto-scaling group. This consists of the autoscaling target & auto scaling policy

#1. Create Autoscaling target
resource "aws_appautoscaling_target" "ecs-service-target" {
  max_capacity       = 6
  min_capacity       = 4
  resource_id        = "service/${aws_ecs_cluster.cluster.name}/${aws_ecs_service.service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  role_arn           = "arn:aws:iam::${aws_account_id}:role/ecsAutoscaleRole"
}




#2. Create Autoscaling policy
resource "aws_appautoscaling_policy" "application-scaling-policy-cpu" {
  name               = "${var.project_name}-application-scaling-policy-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs-service-target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs-service-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs-service-target.service_namespace
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = 75
  }
  depends_on = [aws_appautoscaling_target.ecs-service-target]
}