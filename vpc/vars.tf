/*
Author: Julia Lamenza 
*/

/*Região a ser utilizada para provisionamento da VPC*/
variable "region" { default = "us-east-1" }
/*Zonas de disponibilidade que serão utilizadas para o provisionamento da VPC, será criada 2 subnet por zona de disponibilidade.*/
variable "azs" {
  default = {
    "us-east-1" = "us-east-1a,us-east-1b"
    }
  }
/*Range que será utilizado pela VPC, cada subnet a ser criada, por padrão será máscara /24*/
variable "vpc_cidr" { default = "10.0.0.0/16" }
