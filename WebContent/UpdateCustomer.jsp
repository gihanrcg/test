<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Customers</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@include file = "Header.jsp" %>


<div
		style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Update Customer Details</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="updatecustomers" method="post" action="UpdateCustomerDetails" enctype="multipart/form-data">
<%					
try{
	connectDb db = new connectDb();
	String c=request.getParameter("c");
	
	
	
	String query="select * from customer_details where CustomerID='"+c+"'";
	
	db.rs=db.st.executeQuery(query);  
	
	while(db.rs.next()){ 
%>
								<table>
								<tr><td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("CustomerID"))%>"></td></tr> 
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Customer Name</td>
								<td><input type="text" id="name" name="name" value="<%=db.rs.getString("UserName")%>" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
								<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Password</td>
								<td><input type="text" id="password" name="password" value="<%=db.rs.getString("Password")%>"
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
									<td><a href="viewCustomerdetails.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="updateCustomer"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Update Customer"></td>
										
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
	 %>
</body>
</html>