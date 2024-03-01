# ecs varibales
variable "project_name" {}
variable "environment" {}
variable "ecs_task_execution_role_arn" {}

variable "container_image" {}
variable "env_file_name" {}
variable "env_file_bucket_name" {}
variable "region" {}
variable "private_subnet_az1_id" {}
variable "private_subnet_az2_id" {}
variable "app_server_security_group_id" {}
variable "alb_target_group_arn" {}