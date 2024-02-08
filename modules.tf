# Define the warehouse module with basic configuration
module "warehouse_module" {
  source             = "./modules/warehouse"  # Path to the warehouse module
  warehouse_name     = var.warehouse_name     # Assigning warehouse name from variable
  warehouse_size     = var.warehouse_size     # Setting warehouse size from variable
  warehouse_min_cluster_count = var.warehouse_min_cluster_count # Minimum cluster count
  warehouse_max_cluster_count = var.warehouse_max_cluster_count # Maximum cluster count
  warehouse_max_concurrency_level = var.warehouse_max_concurrency_level # Maximum concurrency level
}

# Configuration for the database module
module "database_module" {
  source        = "./modules/database"        # Path to the database module
  database_name = var.database_name           # Setting the database name from a variable
  # Ensure database creation waits for warehouse setup
  depends_on    = [module.warehouse_module]
}

# Schema module setup
module "schema_module" {
  source        = "./modules/schema"          # Source path for schema module
  database_name = var.database_name           # Database name for the schema
  schema_name   = var.schema_name             # Assign schema name from variable
  # Dependency to ensure schema is created after the database
  depends_on    = [module.database_module]
}

# Table module configuration
module "table_module" {
  source        = "./modules/table"           # Path to table module source
  database_name = var.database_name           # Define which database the table belongs to
  schema_name   = var.schema_name             # Specify schema for the table
  table_name    = var.table_name              # Table name from variable
  # Table creation depends on the schema setup
  depends_on    = [module.schema_module]
}

# Role module for permissions setup
module "role_module" {
  source        = "./modules/role"            # Source directory for the role module
  warehouse_name = var.warehouse_name         # Warehouse name for the role
  database_name = var.database_name           # Database associated with the role
  schema_name   = var.schema_name             # Schema associated with the role
  table_name    = var.table_name              # Table the role has permissions on
  role_name     = var.role_name               # Role name from variable
  # Role setup waits for table creation
  depends_on    = [module.table_module]
}
