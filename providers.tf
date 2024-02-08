# Terraform block to specify provider requirements
terraform {
  # Declare required providers with versions
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake" # Snowflake provider source
      version = "~> 0.76"                  # Version constraint for better control
    }
  }
}

# Snowflake provider configuration
provider "snowflake" {
  # Connection details for Snowflake
  account  = var.account     # Account identifier from variables
  user     = var.username    # Username for authentication, sourced from variables
  password = var.password    # Password for the user, kept in variables
  role     = var.role_name   # Role to assume post-authentication, defined in variables
}
