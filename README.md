Terraform Module for Snowflake
This Terraform module facilitates the management of Snowflake resources, enabling you to configure and maintain your Snowflake data warehouse infrastructure as code. By leveraging this module, you can automate the provisioning of warehouses, databases, schemas, tables, and roles, ensuring a more efficient and error-free setup.

Features
Warehouse Management: Automate the creation and configuration of Snowflake warehouses with customizable settings.
Database and Schema Setup: Easily provision databases and schemas to organize your data logically.
Table Creation: Define and manage tables within your schemas for structured data storage.
Role Management: Provision roles with specific privileges for granular access control.
Requirements
Terraform: Version 0.13 or newer.
Snowflake Provider: Snowflake-Labs/snowflake provider version ~> 0.76.
Usage
To use this module in your Terraform configuration, follow these steps:

Provider Configuration:
Ensure the Snowflake provider is configured in your Terraform:

hcl
Copy code
terraform {
required_providers {
snowflake = {
source = "Snowflake-Labs/snowflake"
version = "~> 0.76"
}
}
}

provider "snowflake" {
account = var.account
user = var.username
password = var.password
role = var.role_name
}
Module Inclusion:
Incorporate this module into your Terraform configuration to manage Snowflake resources:

hcl
Copy code
module "snowflake_setup" {
source = "./path/to/snowflake_module"

# Variables for warehouse configuration

warehouse_name = "your_warehouse_name"
warehouse_size = "X-Small"
auto_suspend = 60
initially_suspended = true

# Database and schema configuration

database_name = "your_database_name"
schema_name = "your_schema_name"

# Role and privileges setup

role_name = "your_role_name"
table_name = "your_table_name"
}
Replace ./path/to/snowflake_module with the actual path to the Snowflake module.

Variables
This module requires the following inputs:

account
username
password
role_name
warehouse_name
warehouse_size
database_name
schema_name
table_name
Refer to the variables.tf file for detailed descriptions and default values of all variables.

Outputs
The module provides outputs that can be used in other parts of your Terraform configuration, such as the names of the created resources. Refer to outputs.tf for details.
