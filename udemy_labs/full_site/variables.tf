variable "my_ports" {
    default = {
        http_port = "80"
        https_port = "443"
        ssh_port = "22"
    }
}

variable "region" {
    default = "ap-south-1"
}

variable "my_instance" {
    default = {
        type = "t2.micro"
        ami = "ami-09a7bbd08886aafdf"        
    }
}

variable "my_domain" {
    default = "terraform.mymoodle-demo.com"
}

variable "my_zone_id" {
    default = "Z0977607AGBHJRXEL6G6"
}


