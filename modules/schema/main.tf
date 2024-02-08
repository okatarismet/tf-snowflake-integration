terraform {
    required_providers {
        snowflake = {
        source  = "Snowflake-Labs/snowflake"
        version = "~> 0.76"
        }
    }
}

resource "snowflake_schema" "productsSchema" {
  database = var.database_name
  name     = var.schema_name
  is_managed = true
}
