resource "aws_security_group_rule" "alb_ingress_80" {
  security_group_id = module.web-alb.security_group_id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_task_80" {
  security_group_id        = module.ecs-fargate.service_sg_id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  source_security_group_id = module.web-alb.security_group_id
}
