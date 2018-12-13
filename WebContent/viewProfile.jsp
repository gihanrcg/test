<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Profile</title>
</head>
<body>

<%@ include file="Header.jsp" %>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}
	else{

	String uname=session.getAttribute("username").toString();




try{
connectDb db = new connectDb();
String query;


	query = "select * from customer_details where UserName ='"+uname+"'";
	db.rs = db.st.executeQuery(query);
	while(db.rs.next()){ 
 %>
 
 
 <div
		style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Your Profile</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="updatecustomers" method="post" action="updateProfileDetails" enctype="multipart/form-data">
 
 						<table>
								
								<tr>
									<td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("CustomerID"))%>"></td>
								</tr> 
									<tr>
										<td align="center"><img width=100px height=100px src="Resources/<%=db.rs.getString("Profilepic")%>"></td>
									</tr>
							<tr>
								<td><br></td>
							</tr>
									<tr>
										<td style="font-family: Calibri; width: 200px; font-size: large" >Profile pic</td>
								        <td><input type="file" id="image" name="image"></td>
									</tr>
							<tr>
								<td><br></td>
							</tr>
									
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Name</td>
								<td><input type="text" id="name" name="name" value="<%=db.rs.getString("UserName")%>"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
								<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Password</td>
								<td><input type="password" id="password" name="password" value="<%=db.rs.getString("Password")%>"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
								<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">E-mail</td>
								<td><input type="text" id="email" name="email" value="<%=db.rs.getString("Email")%>"	
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Address</td>
								<td><input type="text" id="address" name="address" value="<%=db.rs.getString("Address")%>"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Contact Number</td>
								<td><input type="text" id="contactnumber" name="contactnumber" value="<%=db.rs.getString("ContactNum")%>"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							
							<tr>
								<td><br></td>
							</tr>
							<tr>
									<td><a href="Home.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="updateCustomer"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Update Details"></td>
										
							</tr>
							
							
						</table>
					</form>
				</td>
			</tr>
		</table>
	
	</div>
	
<%

	}
}catch(Exception e){
	e.printStackTrace();
}
	}
	 %>
 

</body>
</html>