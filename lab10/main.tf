terraform {
   #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "BlackMamba"

  #  workspaces {
  #    name = "lab10"
  #  }
  #}
  
  cloud {
    hostname = "app.terraform.io"
    organization = "BlackMamba"

    workspaces {
      name = "lab10"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  project_name = "BlackMamba"
}