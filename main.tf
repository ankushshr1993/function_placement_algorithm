terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.17.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.17.0"
    }
  }
}
provider "google" {
  #credentials = "${file("${path.module}/../credentials/account.json")}"
  #credentials = "${file("abhishek-378314-572df7d58e6d.json")}"
  project = "abhishek-378314"
  region  = "eu-west3"
}
