resource "aws_lb" "film-ratings-nw-load-balancer" {
  name               = "film-ratings-nw-load-balancer"
  internal           = true
  load_balancer_type = "network"
  subnets            = ["${aws_subnet.film_ratings_public_sn_01.id}", "${aws_subnet.film_ratings_public_sn_02.id}"]

  tags {
    Name = "film-ratings-nw-load-balancer"
  }

}

resource "aws_lb_target_group" "film-ratings-db-target-group" {
  name                = "film-ratings-db-target-group"
  port                = "5432"
  protocol            = "TCP"
  vpc_id              = "${aws_vpc.film_ratings_vpc.id}"

  health_check {
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    interval            = "30"
    port                = "traffic-port"
    protocol            = "TCP"
  }

  tags {
    Name = "film-ratings-db-target-group"
  }
}

resource "aws_alb_listener" "film-ratings-nw-listener" {
  load_balancer_arn = "${aws_lb.film-ratings-nw-load-balancer.arn}"
  port              = "5432"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.film-ratings-db-target-group.arn}"
    type             = "forward"
  }
}
