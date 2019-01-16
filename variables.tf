# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "ecs_key_pair_name" {
  description = "ECS key pair name"
}

variable "region" {
  description = "AWS region"
}

variable "availability_zone" {
  description = "availability zone used for the film ratings, based on region"
  default = {
    eu-west-1 = "eu-west-1"
  }
}

variable "ami_image_id" {
  description = "Set this to ECS optimized instance for your region e.g. ami-0de29b072b458b107 for eu-west-1"
}

variable "db_password" {
  description = "Database password"
}

variable "film_ratings_app_image" {
  description = "Docker image for the film ratings application"
}

########################### Test VPC Config ################################

variable "film_ratings_vpc" {
  description = "VPC for Film Ratings environment"
}

variable "film_ratings_network_cidr" {
  description = "IP addressing for Film Ratings Network"
}

variable "film_ratings_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "film_ratings_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}
