environment = "dev"
region = "us-east-1"
s3_bucket = "aika-terraform-eks"              #Will be used to set backend.tf
s3_folder_project = "application"            #Will be used to set backend.tf
s3_folder_region = "us-east-1"               #Will be used to set backend.tf
s3_folder_type = "state"                     #Will be used to set backend.tf
s3_tfstate_file = "infrastructure.tfstate.json"   #Will be used to set backend.tf


vpc_id = "vpc-0104dcbab159a9134"
subnet1 = "subnet-0c878cba6685b9376"
subnet2 = "subnet-0f71ccf7b986d123a"
subnet3 = "subnet-06b93a3a4a3f601ed"
cluster_name = "my-cluster"
instance_type = "t2.micro"
asg_max_size = "48" 
asg_min_size = "3"
asg_desired_capacity = "3"
cluster_version = "1.14"