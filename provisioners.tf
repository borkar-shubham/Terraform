//Provisioners are used to transfer the files from host machine to remote server.
# Provisioners can transfer files, local-exec, remote-exec. Provisioners are last options that we can use.
# terraform do not recomends provisioners itself.

  provisioner "file" {
    source = "file1.txt"  #from host machine
    destination = "/tmp/file1.txt"  #to remote machine 
  }
    provisioner "local-exec" {
    command = "echo testing > /tmp/test.txt"
  }
  provisioner "local-exec" {
    working_dir = "/tmp"
    command = "echo ${self.public_ip}>myip.txt"
  }
  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python3", "-c"
    ]
    command = "print('HelloWorld')"
  }
  provisioner "local-exec" {
    when = destroy             #this command will run when instance is destroyed
    command = "env>env.txt"
    environment = {
      envname = "envvalue"
    }
  }
    //Remote provisioners are used to excecute the command in the remote server which has the resources locally available.
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'hello gaurav'>/tmp/test.txt"
    ]
  }
  provisioner "remote-exec" {
    script = "./testscript.sh"   #this script file is locally available in terraform server.
  }