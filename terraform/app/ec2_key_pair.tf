
/*Importa uma key pre-criada para ser usada no acesso a instancia via ssh.*/
resource "aws_key_pair" "keyPair" {
  key_name   = "${var.tag_name}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwfeBjzVH92Cf6LBPAziD+lJtDocOO6Sv/3uPIrWCeK2aG8oboflCCiW0ZM98N9e5glGmeSTgKsDkLSHiboe531hECSRLLzk3ouO7eeUITqcXxhPATZ7YfEtRYrudpq4DYT2jdqVJmBZ5EuDNYKJegnWJAxVwpvS/uqN/GR4MMjr5nH2MbCEHDknUetLMrbqlOly8UWDa9R0xJZbQYi5vHdYuJzvmtNsYj4+stp79K8UE4bAXaOdZ4BS7v4vRm/on+wtZ6tA/VickooxOpXnHbF+fkX/0gvvZyHuvHTKZL7qcz/NOxpgupISQSx7pCJ230JRufoHfcpaoYpj4NLcYL vagrant@ansible"
}

