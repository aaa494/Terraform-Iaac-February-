resource "null_resource" "commands_to_run" {
  provisioner "remote-exec" {
    connection {
        type            = "ssh"
        user            = "centos"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${aws_instance.centos.public_ip}"
    }
    inline = [
      "sudo yum install -y epel-release",

    ]
  }
#   provisioner "file" {
#     connection {
#         type            = "ssh"
#         user            = "centos"
#         private_key     = "${file("~/.ssh/id_rsa")}"
#         host            = "${aws_instance.centos.public_ip}"
#     }
#     source      = "r1soft.repo"
#     destination = "/etc/yum.repos/d"
#   }
#   provisioner "remote-exec" {
#     connection {
#         type            = "ssh"
#         user            = "centos"
#         private_key     = "${file("~/.ssh/id_rsa")}"
#         host            = "${aws_instance.centos.public_ip}"
#     }
#     scripts = ["${file("wordpress.sh")}"]
#   }
}