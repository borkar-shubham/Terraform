//* output "function" {
//    value = "${function-name(" ")}"
// }

//file function:
output "printfile" {
    value = file("${path.module}/<file-name>")
}

//lookup function:
output "lookup" {
    value = lookup("${ path.module}/<file-name>")
}