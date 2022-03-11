module "web-alb" {
  source = "umotif-public/alb/aws"
  version = "~> 2.1.0"

  name_prefix = "web-alb"

  load_balancer_type = "application"

  internal           = false
  vpc_id             = module.web-vpc.vpc_id
  subnets            = module.web-vpc.public_subnets
}

resource "aws_lb_listener" "web-listener" {
  load_balancer_arn = module.web-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = module.ecs-fargate.target_group_arn[0]
  }
}
