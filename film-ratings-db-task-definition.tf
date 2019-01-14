data "aws_ecs_task_definition" "film_ratings_db" {
  task_definition = "${aws_ecs_task_definition.film_ratings_db.family}"
  depends_on = ["aws_ecs_task_definition.film_ratings_db"]
}

resource "aws_ecs_task_definition" "film_ratings_db" {
  family                = "film_ratings_db"
  volume {
    name = "filmdbvolume"

    docker_volume_configuration {
      scope         = "shared"
      autoprovision = true
    }
  }
  network_mode = "awsvpc"
  container_definitions = <<DEFINITION
[
  {
    "name": "film_ratings_db",
    "image": "postgres:alpine",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 5432
      }
    ],
    "environment": [
      {
        "name": "POSTGRES_DB",
        "value": "filmdb"
      },
      {
        "name": "POSTGRES_USER",
        "value": "filmuser"
      },
      {
        "name": "POSTGRES_PASSWORD",
        "value": "${var.db_password}"
      }
    ],
    "mountPoints": [
        {
          "readOnly": null,
          "containerPath": "/var/lib/postgresql/data",
          "sourceVolume": "filmdbvolume"
        }
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "film_ratings_db",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "memory": 512,
    "cpu": 256
  }
]
DEFINITION
}
