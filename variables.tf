variable "username" {
  type = string                    // variable types --> string, number, bool, object({ATTR NAME> = <TYPE>...}), list(string), list(object), set(type), map(type), tupple
  //default = "World"   
}

variable "age" {
    type = number
}

variable "fruits" {
  type = list
}
