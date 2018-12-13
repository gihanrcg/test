<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Suppliers</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@ include file="Header.jsp" %>



	<table align ="center">
             <tr>
					
					<td style="font-size: larger; color: black"><h3 align="center">Supplier Details</h3></td>
			
			</tr>			
			
	</table>
	
	
		<table align="center">
	

	<tr>
			
			 <td><a href="viewSupList.jsp"><input name="back"style="margin-right:5px;color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Show All Suppliers"></a></td>
			<td><form action="viewSupList.jsp" method="post"><input style="margin-right:5px;border: 1px solid black; border-radius:5px" type="text" name="s1" placeholder="  search here...."><input  name="add"style="margin-right:10px;color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Search"></form></td>
			<td><a href="viewInvItems.jsp"><input name="add"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="View Inventory"></a></td>
			<td><a href="addSup.jsp"><input name="add"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Add New Supplier"></a></td> 
			<td><a href="viewPO.jsp"><input name="po"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="View Purchase Orders"></a></td>
			<td><a href="stockLevel.jsp"><input name="stock"style="color: white; background-color: green; border: 2px solid green; border-radius: 5px;"type="button" value="View Stock Level"></a></td>

	</tr>
			
	
	
	
</table>
	
<hr width="800px" align="center">
	
	
	

	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
		
		<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >




			<tr >
				<th>SupplierID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Email</th>
				
				<%
					try {

						connectDb db = new connectDb();
						

						String search=request.getParameter("s1");
						String query;
						if(search!=null){
							query="select * from supplier where SupplierID like'%"+search+"%'or SName like '%"+search+"%' or SAddress like '%"+search+"%' or SContact like '%"+search+"%' or SEmail like '%"+search+"%'";
						}
						else{

							 query = "select * from supplier";
						}

						db.rs = db.st.executeQuery(query);

						while (db.rs.next()) {
				%>
			
			<tr>
				<td align="center"><%=db.rs.getString("SupplierID")%></td>
				<td align="center"><%=db.rs.getString("SName")%></td>
				<td align="center"><%=db.rs.getString("SAddress")%></td>
				<td align="center"><%=db.rs.getString("SContact")%></td>
				<td align="center"><%=db.rs.getString("SEmail")%></td>
				<td align="center"><a href="makePO.jsp?u=<%=db.rs.getString("SupplierID")%>"><input name="po" style="color: white; background-color:green; border: 2px solid green; border-radius: 5px;"type="button" value="Make PO"></a></td>
				<td align="center"><a href="updateSupplier.jsp?u=<%=db.rs.getString("SupplierID")%>"><input name="update" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Update Details"></a></td>
				<td align="center"><form name="deleteSupplier" method="post" action="deleteSupplier?u=<%=db.rs.getString("SupplierID")%>"><input name="delete"style="color: white; background-color: red; border: 2px solid red; border-radius: 5px;"type="submit" value="Delete"></form></td>




			</tr>

			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>




		</table>

	</div>
	
	<hr width="800px" align="center">
	

</body>
</html>