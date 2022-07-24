variable "username" {
  type = string                    // variable types --> string, number, bool, object({ATTR NAME> = <TYPE>...}), list(string), list(object), set(type), map(type), tupple
  default = "Shubham Borkar"   
}

variable "age" {
    type = number
    default = 28
}

variable "fruits" {
  type = list
  default = ["mango", "banana", "kiwi"]
}
