output "region" {
  value = "${var.region}"
}

output "film_ratings_vpc_id" {
  value = "${aws_vpc.film_ratings_vpc.id}"
}

output "film_ratings_public_sn_01_id" {
  value = "${aws_subnet.film_ratings_public_sn_01.id}"
}

output "film_ratings_public_sn_02_id" {
  value = "${aws_subnet.film_ratings_public_sn_02.id}"
}

output "film_ratings_public_sg_id" {
  value = "${aws_security_group.film_ratings_public_sg.id}"
}

# output "ecs-service-role-arn" {
#   value = "${aws_iam_role.ecs-service-role.arn}"
# }

# output "ecs-instance-role-name" {
#   value = "${aws_iam_role.ecs-instance-role.name}"
# }

# output "ecs-load-balancer-name" {
#     value = "${aws_alb.ecs-load-balancer.name}"
# }

# output "ecs-target-group-arn" {
#     value = "${aws_alb_target_group.ecs-target-group.arn}"
# }
