variable "username" { // variable types --> string, number, bool, object({ATTR NAME> = <TYPE>...}), list(string), list(object), set(type), map(type), tupple
  type = string
}

variable "age" {
  type    = number
  default = 28
}

variable "fruits" {
  type    = list(any)
  default = ["mango", "banana", "kiwi"]
}

variable "bool" {
  type        = bool
  description = "It's bool number"
  default     = false
}

variable "userage-map" {
  type = map(any)
  default = {
    sachin = 25
    ritesh = 20
    suhani = 19
  }
}

variable "string-special-chars" {
  default = "\\.<>[]{}_-"
}

// A variable with underscores.
variable "input_with_underscores" {}

// A variable with pipe in the description
variable "input-with-pipe" {
  description = "It includes v1 | v2 | v3"
  default     = "v1"
}

variable "input-with-code-block" {
  description = <<EOD
This is a complicated one. We need a newline.  
And an example in a code block
```
default     = [
  "machine rack01:neptune"
]
```
EOD
  default = [
    "name rack:location"
  ]
}

variable "long_type" {
  type = object({
    name = string,
    foo  = object({ foo = string, bar = string }),
    bar  = object({ foo = string, bar = string }),
    fizz = list(string),
    buzz = list(string)
  })
  default = {
    name = "hello"
    foo = {
      foo = "foo"
      bar = "foo"
    }
    bar = {
      foo = "bar"
      bar = "bar"
    },
    fizz = []
    buzz = ["fizz", "buzz"]
  }
  description = <<EOF
This description is itself markdown.
It spans over multiple lines.
EOF
}

variable "no-escape-default-value" {
  description = "The description contains `something_with_underscore`. Defaults to 'VALUE_WITH_UNDERSCORE'."
  default     = "VALUE_WITH_UNDERSCORE"
}

variable "with-url" {
  description = "The description contains url. https://www.domain.com/foo/bar_baz.html"
  default     = ""
}

variable "string_default_empty" {
  type    = string
  default = ""
}

variable "string_default_null" {
  type    = string
  default = null
}

variable "string_no_default" {
  type = string
}

variable "number_default_zero" {
  type    = number
  default = 0
}

variable "bool_default_false" {
  type    = bool
  default = false
}

variable "list_default_empty" {
  type    = list(string)
  default = []
}

variable "object_default_empty" {
  type    = object({})
  default = {}
}