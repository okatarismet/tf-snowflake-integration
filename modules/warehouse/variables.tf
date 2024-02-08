# Warehouse-related variables
variable "warehouse_name" {
  type = string  # Name of the warehouse
}

variable "warehouse_size" {
  type = string  # Size category of the warehouse
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