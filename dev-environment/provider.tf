#0. Configure The Provider
terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "4.64.0"
    }


    postgresql = { # This line is what needs to change.
      source = "cyrilgdn/postgresql"
      #version = "1.15.0"
    }
  }
}

# Configuration options
provider "aws" {
  region = var.region
}



provider "postgresql" {
  scheme = "awspostgres"
  host   = "test"
  port   = 5432
  #name           = var.db_name
  username        = var.username
  password        = var.password
  sslmode         = "require"
  connect_timeout = 15
}