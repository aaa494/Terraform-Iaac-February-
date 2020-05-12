resource "aws_instance" "jenkins" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.medium"
  key_name = "${aws_key_pair.us-east-2-key.key_name}"
  security_groups = ["${aws_security_group.for_jenkins.id}"]
  subnet_id = "${aws_subnet.public1.id}"
  associate_public_ip_address = true
  # user_data = "${file("user_data.sh")}"
  tags = {
    Name = "Jenkins"
  }
  provisioner "remote-exec" {
    connection {
        type        = "ssh"
        user        = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
        host        = "${self.public_ip}"
      }
    inline = [
        "echo -e $(tput setaf 1) 'Jenkins Passwd is: '$(tput sgr0) $(tput setaf 2)'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'$(tput sgr0)",
        "sudo yum install java-1.8.0-openjdk-devel -y",
        "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
        "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
        "sudo yum install jenkins -y",
        "sudo systemctl start jenkins",
        "sudo systemctl enable jenkins",
      ]
  }
}
