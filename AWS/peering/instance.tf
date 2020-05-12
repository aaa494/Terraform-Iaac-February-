resource "aws_instance" "wordpress" {
  instance_type = "t2.micro"
  ami = "ami-0323c3dd2da7fb37d"
  key_name = "${aws_key_pair.us-east-1-key.key_name}"
  security_groups = ["${aws_security_group.allow_icmp.name}"]
}

resource "aws_key_pair" "us-east-1-key" {
    key_name = "for_peering"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCthVdXGXUJ7y9NpQgl9q33quli9eXnwoWQuHXjduacqEBgUI8klrwBlGf11jKxIuiJlacwcsCzhyThOvwWh/C3EP7bUoCUYM+wp7SE2cD3SsjIn63bfVIV9Jc7l6vkQcE11LV9Eg0UHpqeo9B5Zr9LuJu5wCOn+Yxf/W00BDDxFoMGRdjUsCf6ga1hmOZevbxqeXQxtoZHMMjbkVEaWOyM4Wf80BtzuMgUxvWtWZVMbFuZ0qhCHrTlS/bMa42jKqeGygSzSGcsDyCqthJxEAKiPruX0bcrKtfKZASsBtSzjXTdWC9c+LKUg2pVtlU+kFzbo9odxje9avUskEQjYYbz aika@Air-Aika"
}

resource "aws_security_group" "allow_icmp" {
  name        = "allow_icmp"
  description = "Allow icmp inbound traffic"

  ingress {
    description = "ICMP from VPC"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_icmp"
  }
}