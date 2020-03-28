provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "ap-southeast-1"
}
resource "aws_key_pair" "default" {
  key_name = "terraform_key"
  public_key = "INSERT_KEY_HERE"
}


}

resource "aws_instance" "nodejs" {
   ami  = "ami-01f7527546b557442"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   user_data = "${file("nodejs_install.sh")}"

  tags = {
    Name = "nodejs_server"
  }
}

resource "aws_instance" "mongodb" {
   ami  = "ami-01f7527546b557442"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   user_data = "${file("mongodb_install.sh")}"

  tags = {
    Name = "mongodb_server"
  }
}

resource "aws_instance" "jenkins" {
   ami  = "ami-01f7527546b557442"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   user_data = "${file("jenkins_install.sh")}"

  tags = {
    Name = "jenkins_server"
  }
}