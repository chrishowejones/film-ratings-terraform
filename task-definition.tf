data "aws_ecs_task_definition" "film_ratings_app" {
  task_definition = "${aws_ecs_task_definition.film_ratings_app.family}"
  depends_on = ["aws_ecs_task_definition.film_ratings_app"]
}

resource "aws_ecs_task_definition" "film_ratings_app" {
    family                = "film_ratings_app"
    container_definitions = <<DEFINITION
[
  {
    "name": "film_ratings_app2",
    "image": "chrishowejones/film_ratings_app:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ],
    "environment": [
      {
        "name": "DB_HOST",
        "value": "${aws_lb.film_ratings_nw_load_balancer.dns_name}"
      },
      {
        "name": "DB_PASSWORD",
        "value": "${var.db_password}"
      }
    ],
    "memory": 256,
    "cpu": 128
  }
]
DEFINITION
}
