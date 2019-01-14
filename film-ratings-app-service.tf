resource "aws_ecs_service" "film_ratings_app_service" {
  	name            = "film_ratings_app_service"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.film_ratings_ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.film_ratings_app.family}:${max("${aws_ecs_task_definition.film_ratings_app.revision}", "${data.aws_ecs_task_definition.film_ratings_app.revision}")}"
        depends_on      = [ "aws_ecs_service.film_ratings_db_service"]
  	desired_count   = 1

  	load_balancer {
    	target_group_arn  = "${aws_alb_target_group.film_ratings_app_target_group.arn}"
    	container_port    = 3000
    	container_name    = "film_ratings_app"
	}
}
