resource "aws_alb" "film_ratings_alb_load_balancer" {
  name                = "film-ratings-alb-load-balancer"
  security_groups     = ["${aws_security_group.film_ratings_public_sg.id}"]
  subnets             = ["${aws_subnet.film_ratings_public_sn_01.id}", "${aws_subnet.film_ratings_public_sn_02.id}"]

  tags {
    Name = "film-ratings-alb-load-balancer"
  }
}

resource "aws_alb_target_group" "film_ratings_app_target_group" {
  name                = "film-ratings-app-target-group"
  port                = "3000"
  protocol            = "HTTP"
  vpc_id              = "${aws_vpc.film_ratings_vpc.id}"
  deregistration_delay = "20"

  health_check {
    healthy_threshold   = "2"
    unhealthy_threshold = "5"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  stickiness {
    type  = "lb_cookie"
  }

  tags {
    Name = "film-ratings-app-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.film_ratings_alb_load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.film_ratings_app_target_group.arn}"
    type             = "forward"
  }
}
