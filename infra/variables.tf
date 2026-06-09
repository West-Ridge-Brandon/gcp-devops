variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "bucket_name" {
  type = string
}

variable "instance_name" {
  type = string
  default = "demo-instance"
}
