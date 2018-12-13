<%@page import="com.oop.dbconnect.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Customer Details</title>



</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@include file = "Header.jsp" %>



<table align ="center">
		 <tr><td style="font-size: larger; color: black"><h3 align="center">Customer Details</h3></td></tr>
	</table>
	

		
		 <table align="center">
	

	<tr>
			 <td><a href="viewCustomerdetails.jsp"><input name="back"style="margin-right:50px;color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Show All Customers"></a></td>
			<td><form action="viewCustomerdetails.jsp" method="post"><input style="margin-right:5px;border: 1px solid black; border-radius:5px" type="text" name="s1" placeholder="  search here...."><input  name="add"style="margin-right:100px;color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Search"></form></td>
			<td><a href="AddCustomer.jsp"><input name="add"style="color: white; background-color: green ; border: 2px solid green; border-radius: 5px;"type="button" value="Add new Customer"></a></td>
			

	</tr>
			
	
	
	
</table>
 	
<hr width="1200px" align="center">



	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
	
	<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >




			<tr>
				<th>Customer ID</th>
				<th>User Name</th>
				<th>Password</th>
				<th>E-mail</th>
				<th>Address</th>
				<th>Contact Number</th>
				<th>Profile picture</th>
				<th></th>
				<th></th>
				
				
				<%
					try {

						connectDb db = new connectDb();
						
						String search=request.getParameter("s1");			
						String query;
						if(search!=null){
							query="select * from customer_details where CustomerID like'%"+search+"%'or UserName like '%"+search+"%' or Email like '%"+search+"%' or Address like '%"+search+"%' or ContactNum like '%"+search+"%'";
						}
						else{

							 query = "select * from customer_details ";
						}

						db.rs = db.st.executeQuery(query);

						while (db.rs.next()) {
				%>
			
			<tr>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("CustomerID")%></td>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("UserName")%></td>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("Password")%></td>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("Email")%></td>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("Address")%></td>
				<td class = ".tdcontent" align="center"><%=db.rs.getString("ContactNum")%></td>
				<td class = ".tdcontent" align="center"><img width=100px height=100px src="Resources/<%=db.rs.getString("Profilepic")%>"></td>
				 <td class = ".tdcontent" align="center"><a href="UpdateCustomer.jsp?c=<%=db.rs.getString("CustomerID")%>"><input name="update" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Update"></a></td>
				<td class = ".tdcontent" align="center"><form name="deleteCustomer" method="post" action="DeleteCustomer?c=<%=db.rs.getString("CustomerID")%>"><input name="delete"style="color: white; background-color: red; border: 2px solid red; border-radius: 5px;"type="submit" value="Delete"> </form></td>
 



			</tr>

			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>




		</table>

	</div>
	
	<hr width="1200px" align="center">
	

</body>
</html>