
/*Procura na conta uma AMI com o nome iniciado pelo nome definido, sempre utiliza a ultima versão criada*/
data "aws_ami" "packer-ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["packer-*"]
  }
}

