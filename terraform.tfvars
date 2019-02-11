# You may need to edit these variables to match your config
db_password= "password"
ecs_cluster="film_ratings_cluster"
ecs_key_pair_name="film_ratings_key_pair"
region= "eu-west-1"
ami_image_id= "ami-0728d926f3f65c089" # need to change this if you change regions from eu-west-1
film_ratings_app_image= "chrishowejones/film-ratings-app:latest"

# no need to change these unless you want to
film_ratings_vpc = "film_ratings_vpc"
film_ratings_network_cidr = "210.0.0.0/16"
film_ratings_public_01_cidr = "210.0.0.0/24"
film_ratings_public_02_cidr = "210.0.10.0/24"
max_instance_size = 3
min_instance_size = 1
desired_capacity = 2
