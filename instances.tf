resource "aws_instance" "haproxy" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.haproxy_sg.id]
  key_name               = var.ssh_key_name

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "k8s-haproxy"
  }
}

resource "aws_instance" "master" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.master_sg.id]
  key_name               = var.ssh_key_name

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type2
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  key_name               = var.ssh_key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.volume_size2
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "Jenkins-Server"
  }
}


resource "aws_instance" "worker" {
  count                  = var.worker_count
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = count.index % 2 == 0 ? aws_subnet.private_subnet_a.id : aws_subnet.private_subnet_b.id
  vpc_security_group_ids = [aws_security_group.worker_sg.id]
  key_name               = var.ssh_key_name

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "k8s-worker-${count.index}"
  }
}