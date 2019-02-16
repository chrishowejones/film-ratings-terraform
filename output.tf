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

output "ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}

output "ecs-instance-role-name" {
  value = "${aws_iam_role.ecs-instance-role.name}"
}

output "app-alb-load-balancer-name" {
  value = "${aws_alb.film_ratings_alb_load_balancer.name}"
}

output "app-alb-load-balancer-dns-name" {
  value = "${aws_alb.film_ratings_alb_load_balancer.dns_name}"
}

output "nw-lb-load-balancer-dns-name" {
  value = "${aws_lb.film_ratings_nw_load_balancer.dns_name}"
}

output "nw-lb-load-balancer-name" {
  value = "${aws_lb.film_ratings_nw_load_balancer.name}"
}

output "film-ratings-app-target-group-arn" {
  value = "${aws_alb_target_group.film_ratings_app_target_group.arn}"
}

output "film-ratings-db-target-group-arn" {
  value = "${aws_lb_target_group.film_ratings_db_target_group.arn}"
}

output "mount-target-dns" {
  description = "Address of the mount target provisioned"
  value = "${aws_efs_mount_target.filmdbefs-mnt.0.dns_name}"
}
