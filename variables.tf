# Define basic authentication and account variables for Snowflake
variable "account" {
  type        = string
  description = "Unique identifier for the Snowflake account."
}

variable "password" {
  type        = string
  description = "Secure password for Snowflake authentication. Keep it secret!"
  sensitive   = true  # This marks the variable as sensitive, hiding its value in logs and outputs.
}

variable "username" {
  type        = string
  description = "Username for Snowflake account access."
}

# Warehouse configuration details
variable "warehouse_name" {
  type        = string
  description = "Specifies the name of the Snowflake warehouse, e.g., 'Amphion Shopping Warehouse'."
}

# Database and schema definitions for better organization and access control
variable "database_name" {
  type        = string
  description = "Name of the Snowflake database to be used, e.g., 'Products Database'."
}

variable "schema_name" {
  type        = string
  description = "Defines the schema within the specified Snowflake database, e.g., 'Products Schema'."
}

# Role and table setup for granular permissions and data structure
variable "role_name" {
  type        = string
  description = "Role assigned for specific access controls, e.g., 'Product Manager Role'."
}

variable "table_name" {
  type        = string
  description = "Name of the table within the schema for storing data, e.g., 'Products Table'."
}

# Additional configurations for regional deployment and warehouse sizing
variable "region" {
  type        = string
  description = "The cloud region where the Snowflake resources will be provisioned."
}

variable "warehouse_size" {
  type        = string
  description = "The size of the Snowflake warehouse, affecting performance and cost."
}
variable "warehouse_min_cluster_count"{
  type = number  # Minimum number of clusters
}
variable "warehouse_max_cluster_count"{
  type = number  # Maximum number of clusters
}
variable "warehouse_max_concurrency_level"{
  type = number  # Maximum number of concurrent queries
}

variable "role" {
  type        = string
  description = "Specifies the Snowflake role to be used for operations."
}

# Terraform version requirement for ensuring compatibility
terraform {
  required_version = ">= 0.13"  
}
