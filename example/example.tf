provider "aws" {
  region = "us-east-1"
}

module "airbyte" {

  source         = "./../"
  environment    = "prod"
  instance_class = "db.t3.micro"
  vpc_id         = "vpc-xxxxxxxxxx" # add vpc id here
  subnet_ids     = ["subnets-xxxxxxx", "subnets-xxxxxxxx"]

  password   = "" #if add some password
  allowed_ip = ["0.0.0.0/0"]
}