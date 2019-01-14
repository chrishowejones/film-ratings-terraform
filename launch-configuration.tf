resource "aws_launch_configuration" "ecs-launch-configuration" {
  name                        = "ecs-launch-configuration"
  image_id                    = "${var.ami_image_id}" # need to change ami for different regions
  instance_type               = "t2.small"
  iam_instance_profile        = "${aws_iam_instance_profile.ecs-instance-profile.id}"

  root_block_device {
    volume_type = "standard"
    volume_size = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups             = ["${aws_security_group.film_ratings_public_sg.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${var.ecs_key_pair_name}"
  user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
                                  mkdir -p /mnt/efs/postgres
                                  cd /mnt
                                  sudo yum install -y amazon-efs-utils
                                  sudo mount -t efs fs-1a14a4d2:/ efs
                                  EOF
  }
