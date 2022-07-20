output "user-name" {
  value = "Hello ${var.username}"
}

output "user-age" {
  value = "Your age is ${var.age}"
}

output "fruits-name" {
  value = "Your favorite fruit is ${var.fruits[1]}"
}


//terraform plan -var "username=shubham"  -var "age=28" --> to define variable in non interractive mode