variable "s3_bucket" {
  type = map(any)
}

variable "required_tags" {
  type = map(string)
}


data "external" "validate_schema" {
  program = [ "node", "${path.module}/../../validation/src/validate.js"]
  query = {
    value = jsonencode({
      required_tags = var.required_tags
      s3_bucket = var.s3_bucket
    })
    schema = file("${path.module}/s3example_schema.json")
  }
}