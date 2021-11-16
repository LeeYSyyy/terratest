variable "name" {
  type    = string
  default = "yslee"
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "ava" {
  type    = list(string)
  default = ["a", "c"]
}

variable "key" {
  type    = string
  default = "yslee-key"
}

variable "cidr_main" {
  type    = string
  default = "10.0.0.0/16"
}

variable "cidr_public" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "cidr_private" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "cidr_privatedb" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "cidr_route" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ipv6_cidr_blocks" {
  type    = string
  default = "::/0"
}

variable "protocol_http" {
  type    = string
  default = "http"
}

variable "port_http" {
  type    = number
  default = 80
}

variable "protocol_http1" {
  type    = string
  default = "HTTP"
}

variable "protocol_tcp" {
  type    = string
  default = "tcp"
}

variable "protocol_ssh" {
  type    = string
  default = "ssh"
}

variable "port_ssh" {
  type    = number
  default = 22
}

variable "db_name" {
  type    = string
  default = "mysql"
}

variable "port_mysql" {
  type    = number
  default = 3306
}

variable "protocol_icmp" {
  type    = string
  default = "icmp"
}

variable "port_zero" {
  type    = number
  default = 0
}

variable "protocol_minus" {
  type    = number
  default = -1
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

variable "private_ip" {
  type    = string
  default = "10.0.0.11"
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "storage_size" {
  type    = number
  default = 20
}

variable "storage_type" {
  type    = string
  default = "gp2"
}

variable "mysql_version" {
  type    = string
  default = "8.0"
}

variable "sql_engine" {
  type    = string
  default = "mysql"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "It12345!"
}

variable "name_db" {
  type    = string
  default = "test"
}

variable "instance_db" {
  type    = string
  default = "db.t2.micro"
}
