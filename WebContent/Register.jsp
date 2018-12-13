 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
</head>
<body>
<%@ include file="Header.jsp"%>
<div
		style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Create New Account</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="registercustomer" method="post" action="customerRegistration" enctype="multipart/form-data">
						<table>
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Name</td>
								<td><input type="text" id="name" name="name"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
								<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Password</td>
								<td><input type="password" id="password" name="password"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Re-Type Password</td>
								<td><input type="password" id="password1" name="password1"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							
							
							
								<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">E-mail</td>
								<td><input type="text" id="email" name="email"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Address</td>
								<td><input type="text" id="address" name="address"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Contact Number</td>
								<td><input type="text" id="contactnumber" name="contactnumber"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>		
							<tr>
								<td></td>
								<td style="color: black">Add your photos</td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Photos</td>
								<td><input type="file" id="image" name="image"></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>




							<tr>
									<td><a href="Login.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="register"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Register"></td>
										
							</tr>
							
							
						</table>
					</form>
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>