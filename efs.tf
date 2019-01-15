resource "aws_efs_file_system" "filmdbefs" {
  tags {
    Name = "filmdbefs"
  }
}

locals {
  subnets = ["${aws_subnet.film_ratings_public_sn_01.id}", "${aws_subnet.film_ratings_public_sn_02.id}"]
}

resource "aws_efs_mount_target" "filmdbefs-mnt" {
  count = "2"

  file_system_id = "${aws_efs_file_system.filmdbefs.id}"
  subnet_id = "${element(local.subnets, count.index)}"

  security_groups = ["${aws_security_group.film_ratings_public_sg.id}"]

}
