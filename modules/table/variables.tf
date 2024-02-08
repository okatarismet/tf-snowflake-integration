variable "database_name" {
  type = string
}
variable "schema_name" {
  type = string
}
variable "table_name" {
  type = string
}
variable "table_columns" {
  description = "List of table column definitions"
  type = list(object({
    name     = string
    type     = string
    nullable = bool
    default  = string
  }))
  default = [
    {
      name     = "id"
      type     = "NUMBER"
      nullable = false
      default  = "AUTOINCREMENT"
    },
    {
      name     = "data"
      type     = "VARCHAR"
      nullable = true
      default  = "NULL"
    }
  ]
}