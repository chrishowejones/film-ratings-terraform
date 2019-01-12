resource "aws_ecs_cluster" "film-ratings-ecs-cluster" {
    name = "${var.ecs_cluster}"
}
