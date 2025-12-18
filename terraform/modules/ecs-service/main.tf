resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = var.cluster_id
  task_definition = var.task_definition
  desired_count   = var.desired_count
  launch_type     = var.launch_type

  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent

  enable_ecs_managed_tags = var.enable_ecs_managed_tags
  propagate_tags          = var.propagate_tags

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

  dynamic "load_balancer" {
    for_each = var.alb_target_group_arn != "" ? [var.alb_target_group_arn] : []
    content {
      target_group_arn = load_balancer.value
      container_name   = "app" # debe coincidir con tu container_name
      container_port   = 80    # ajustar según tu contenedor
    }
  }

  lifecycle {
    # IMPORTANTE: Terraform no redepliega task_definition, lo hace CI/CD externo
    ignore_changes = [task_definition]
  }
}
