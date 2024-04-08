#1. Create Security Group (With Outbound Rule Attached)


resource "aws_security_group" "sg" {
  name   = "${var.project_name}-sg"
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

#2a. Create Security Group Inbound Rule 1 (http)
resource "aws_security_group_rule" "sgr-1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}

#2b. Create Security Group Inbound Rule 2 (ssh)
resource "aws_security_group_rule" "sgr-2" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}

#2c. Create Security Group Inbound Rule 3 (rds database)
resource "aws_security_group_rule" "sgr-3" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}

#2d. Create Security Group Inbound Rule 4 (Jenkins)
resource "aws_security_group_rule" "sgr-4" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}

#2e. Create Security Group Inbound Rule 5 (Https)
resource "aws_security_group_rule" "sgr-5" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.sg.id
  cidr_blocks       = ["0.0.0.0/0"]

}