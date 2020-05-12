terraform { 
backend "s3" { 
bucket = "sdlc-aika-prodd" 
key = "vet/eu-west-1/sharedtools/prod/infrastructure.tfstate" 
region = "eu-west-1" 
  } 
} 
