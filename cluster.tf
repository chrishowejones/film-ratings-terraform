resource "aws_ecs_cluster" "film_ratings_ecs_cluster" {
  name = "${var.ecs_cluster}"
}
