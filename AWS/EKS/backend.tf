terraform { 
backend "s3" { 
bucket = "aika-terraform-eks" 
key = "application/us-east-1/state/dev/infrastructure.tfstate.json" 
region = "us-east-1" 
  } 
} 
