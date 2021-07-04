provider "aws"{
  region= "us-east-1"
  profile= default
}

resource "aws_instance" "os1"{
  ami= "ami-0ab4d1e9cf9a1215a"
  instance_type= "t2.micro"
  key_name= "awsKeynew"
  tags= {
    Name= "Kubernetes WebApp"
  }
}

output "os1"{
  value= aws_instance.os1.public_ip
}

resource "null_resource" "invent"{
  depends_on= [aws_instance.os1]
  provisioner "local-exec"{
    command = "echo ${aws_instance.os1.public_ip} > inventory"
  }
}
resource "null_resource" "yaml"{
  depends_on= [aws_instance.os1]
  provisioner "local-exec"{
    command = "ansible-playbook config.yml"
  }
}

