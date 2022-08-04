#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo echo <<-EOF
<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Form</title>
</head>

<body>

<form>
  <table>
	<tr>
		<td><p><b>Emplyment Application</b></p></td>
		<td></td>
	</tr>
	<tr>
		<td>First Name:</td>
		<td><input type="text" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input type="text" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Position:</td>
		<td>
			<select name="Position">    <!--In the value section the first two characters of option names must be added.-->
				<option value="MA">Manager</option>
				<option value="CL">Clerk</option>
				<option value="AS">Assistant</option>
				<option value="SU">Supervisor</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td>Experience Level:</td>
		<td>
			<select>
				<option value="EL">Entry Level</option>
				<option value="BE">Basic Experience</option>
				<option value="PR">Profficient</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Job Type:</td>
		<td>
			<input type="checkbox" name="ft"/>Full-time
			<input type="checkbox" name="pt"/>Part-time
			<input type="checkbox" name="ct"/>Contract
		</td>
	</tr>

	<tr>
		<td>Employment Status:</td>
		<td>
			<input type="radio" name="estatus" value="employed"/>Employed
			<input type="radio" name="estatus" value="unemployed"/>Unemployed
			<input type="radio" name="estatus" value="student"/>Student
		</td>
		
	
		
	</tr>
	<tr>
		<td>Additional Comments:</td>
		<td>
			<textarea name="comments" cols="45" rows="5"></textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="submit" name="submit" value="Submit"/>
			<input type="reset" name="reset" value="Reset"/>
		</td>
	</tr>
  </table>
</form>

</body>

</html>
EOF > /var/www/nginx/index.nginx-debian.html
systemctl start nginx
systemctl enable nginx