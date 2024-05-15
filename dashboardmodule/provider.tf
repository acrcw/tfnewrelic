terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.36.0"
    }
  }
}

provider "newrelic" {
  # Configuration options
  account_id = "4438270" 
  api_key ="NRAK-VLHM53OYR2J81Z27YE865HM5AR4"
  region = "US"
}