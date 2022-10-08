//There are three ways to call the variables -
#1 Entering variables in command line interractive mode 
#2 Entering variables inline with terraform commands at command line
#3 Putting variables attributes into the variable section under the default=
#4 Calling the system default environment variables by doing "export TF_VAR_<variable>=<attribute>"
#5 Make the terraform.tfvars file to pass number of arguments to the command line as variables -
# This lets you work with the easier way in case of there is large number of variables
# Terraform will read this file and put the variables defined in the terraform.tfvars file into the command line.

age  = 99
user = "Mark Zukerburg"

// By default terraform will read this file with the file name as terraform.tfvars.
// But if you want to put the custom file name, then simply create the file with the name you want and
// pass it to the command line as : <terraform-command> -var-file=<custom-name>.tfvars

// This will help you to put the variable values according to the different departments 
// eg. Development, Testing, and Production with their different values of the variables.