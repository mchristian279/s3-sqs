# AWS s3 e SQS

### Cria Bucket S3 e cria evento de notifição Bucket que filtra objetos com a extensão ".log" e encaminha os arquivos para fila SQS

### Tecnologias Utilizadas:
- AWS
- Terraform
- Terragrunt

### Pré requisitos:
- Terraform v0.14.4
- Terragrunt v0.31.0

### Terraform:
- locals.tf
- main.tf
- output.tf
- s3.tf
- sqs.tf
- terraform.tfvars
- variable.tf

### Terragrunt:
- backend.tf
- provider.tf

### Como Utilizar:

Terraform:

*terraform.tfvars* variáveis a serem modificadas:

```
region = "us-east-1"

s3bucket = "my-bucket-s3-lab-name-123123-teste1111-12"

sqsnamedlq = "lab-queue-dlq"

sqsname = "lab-queue"
```
Terragrunt:

Estrutura utilizada de diretórios Terragrunt:
```
├── repo-name 
|       ├── region
|             ├── environment
|                   ├── resource
|                        ├── locals.ft
|                        ├── main.tf
|                        ├── output.tf
|                        ├── s3.tf
|                        ├── sqs.tf
|                        ├── variable.tf
|                        ├── terragrunt.hcl - (Secundario)
|                        ├── backend.tf (gerado pelo terragrunt)
|                        ├── provider.tf (gerado pelo terragrunt)
|             ├── terragrunt.hcl - (Principal)
```
*terragrunt.hcl* (Principal), define o account_id da AWS:
```
locals {
  aws_region = "us-east-1"
  account_id = "yor-account-id-here"
  profile = "lab"
  stack = "aws-lab"
}
```

