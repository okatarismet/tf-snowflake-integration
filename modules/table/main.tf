terraform {
    required_providers {
        snowflake = {
        source  = "Snowflake-Labs/snowflake"
        }
    }
}

resource "snowflake_table" "products_table" {
  database = var.database_name
  schema   = var.schema_name
  name     = var.table_name
  
  dynamic "column" {
    for_each = var.table_columns
    content {
      name     = column.value.name
      type     = column.value.type
    }
  }

  comment = "A table for storing product information"
}