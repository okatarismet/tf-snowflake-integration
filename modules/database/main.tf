terraform {
    required_providers {
        snowflake = {
        source  = "Snowflake-Labs/snowflake"
        version = "~> 0.76"
        }
    }
}
# Creating the database
resource "snowflake_database" "products" {
  name = var.database_name
}