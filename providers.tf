terraform {

  required_version = ">= 1.6.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-associate-adp"
    key    = "hackone/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  alias   = "prod"
  region  = "us-east-1"
  profile = "terraform"
}

#------- Steps
#1 - Atribuir tags comuns a recursos usando o locals
#2 - Usar recursos dinâmicos
#3 - Usar o count para criar vários recurso de uma unica vez reaproveitando o código
#4 - Construir o pipeline de deploy do terraform