resource "aws_db_instance" "RDS" {
  identifier            = "example-db"
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t2.micro"
  username               = "admin"
  password              = "kenny_password"
  publicly_accessible   = false
  multi_az              = false

tags = {
    Name = "${var.project_name}-${var.environment}-rds"
  }

}


