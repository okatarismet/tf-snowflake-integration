terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

resource "snowflake_role" "product_manager_role" {
  name    = var.role_name
  comment = "This is a new role"
}

# Grant USAGE privilege on warehouse to the role
resource "snowflake_grant_privileges_to_role" "product_manager_role_warehouse" {
  role_name  = snowflake_role.product_manager_role.name
  privileges = ["USAGE"]
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_name
  }
}

# Grant USAGE privilege on database to the role
resource "snowflake_grant_privileges_to_role" "product_manager_role_database" {
  role_name  = snowflake_role.product_manager_role.name
  privileges = ["USAGE"]
  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_name
  }
}

# Grant SELECT privilege on a specific table to the role
resource "snowflake_table_grant" "select_grant" {
  database_name = var.database_name
  schema_name   = var.schema_name
  table_name    = var.table_name
  privilege     = "SELECT"
  roles         = [snowflake_role.product_manager_role.name]
  depends_on    = [snowflake_role.product_manager_role]
}

# Grant USAGE privilege on schema to the role
resource "snowflake_grant_privileges_to_role" "product_manager_role_schema" {
  role_name  = snowflake_role.product_manager_role.name
  privileges = ["USAGE"]
  on_schema {
    schema_name = "\"${var.database_name}\".\"${var.schema_name}\""
  }
  depends_on = [snowflake_role.product_manager_role]
}
