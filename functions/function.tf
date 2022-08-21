// output "function" {
//    value = "${function-name(" ")}"
// }

//file function:
output "printfile_function" {
    value = file("${path.module}/README.md")
}

//lookup function:
output "lookup_function" {
    value = lookup("${var.map-var}", "age", "key not found")
}

//Merging multiple strings into a single string
output "string_merger" {
  value = join(",", ["CLoudb", "DevOps", "Azure", "AWS", "GCP"])  //string elements given in a list
}

//Converting a map into a list
output "map_into_list" {
  value = values(         //values function gives a list of values while key function returns a list of keys
    {
      a = 10,
      b = 12,
      c = 13
    }
  ) 
}

//Merge Mutiple map into one map
output "multi_map_merge" {
  value = merge({env ="dev", project="cbx"}, {billing="abc@gmail.com",location="us-east-1"})
}

//separate the scheme from the given url
output "separate_scheme_and_authority" {
  value = regex("^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<authority>[^/?#]*))?", "https://cignoclouds.com")
  
}

//Join two lists into a single using concat function
output "joining_two_lists" {
  value= concat(["1", "2", "3", "4", "5", "6", "7", "8"], ["a", "b", "c", "d", "e", "f"])
}