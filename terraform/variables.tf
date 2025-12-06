variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "apt-devops-assignment"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "api_port" {
  description = "Port for the API to listen on"
  type        = number
  default     = 8080
}

variable "github_repo" {
  description = "URL of the GitHub repository to clone"
  type        = string
  default     = "https://github.com/pratikphanase/apt-project.git"
}
