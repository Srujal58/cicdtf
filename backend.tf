# state.tf
terraform {
  backend "s3" {
    bucket = "terraform-state-filecicd" 
    key = "CICDTF/terraform.tfstate"
    region = "ca-central-1"
    
  }
}
