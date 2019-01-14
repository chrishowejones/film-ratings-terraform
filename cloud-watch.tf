resource "aws_cloudwatch_log_group" "film_rating_app" {
  name = "film_ratings_app"
}

 resource "aws_cloudwatch_log_group" "film_rating_db" {
  name = "film_ratings_db"
}
