terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

# Create a Warehouse
resource "snowflake_warehouse" "amphion_shopping" {
  name           = var.warehouse_name
  warehouse_size = var.warehouse_size
  min_cluster_count   = var.warehouse_min_cluster_count
  max_cluster_count   = var.warehouse_max_cluster_count
  max_concurrency_level = var.warehouse_max_concurrency_level
}