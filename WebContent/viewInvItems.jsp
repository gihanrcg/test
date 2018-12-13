<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Inventory</title>

<style>
.btn1{
	background-color: #008CBA; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px 10px;
    cursor: pointer;
 
}

</style>


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
		 <tr><td style="font-size: larger; color: black"><h3 align="center">Items In Inventory</h3></td></tr>
	</table>
	

		
		<table align="center" style = "padding: 10px">
	

	<tr>
			 <td><a href="viewInvItems.jsp"><input class="btn1" name="back"type="button" value="Show All Items"></a></td>
			<td><form action="viewInvItems.jsp" method="post"><input style=" color:#008CBA; padding:15px 32px ;    margin-right:5px;border: 2px solid #008CBA; border-radius:5px" type="text" name="s1" placeholder="Search Here..."><input class="btn1" name="add" type="submit" value="Search"></form></td>
			<td><a href="viewSupList.jsp"><input class="btn1"  name="add"  type="button" value="View Suppliers"></a></td>
		   <td><a href="inventoryItems.jsp"><input name="add" class="btn1" type="button" value="Add an Item"></a></td>
			<td><a href="stockLevel.jsp"><input name="stock"class="btn1" type="button" value="View Stock Level"></a></td>


	</tr>
			
	
	
	
</table>
	
<hr width="1200px" align="center">



	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
	
		<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >





			<tr>
				<th>Item ID</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>SubCategory</th>
				<th>Price</th>
				<th>Image</th>
				<th>Details</th>
				
				
				<%
					try {

						connectDb db = new connectDb();
						
						String search=request.getParameter("s1");			
						String query;
						if(search!=null){
							query="select * from inventory where ItemID like'%"+search+"%'or Name like '%"+search+"%' or Category like '%"+search+"%' or SubCategory like '%"+search+"%' or UnitPrice like '%"+search+"%'";
						}
						else{

							 query = "select * from inventory";
						}

						db.rs = db.st.executeQuery(query);

						while (db.rs.next()) {
				%>
			
			<tr>
				<td align="center"><%=db.rs.getString("ItemID")%></td>
				<td align="center"><%=db.rs.getString("Name")%></td>
				<td align="center"><%=db.rs.getString("Category")%></td>
				<td align="center"><%=db.rs.getString("SubCategory")%></td>
				<td align="center"><%=db.rs.getString("UnitPrice")%></td>
				<td align="center"><img width=100px height=100px src="Resources/<%=db.rs.getString("Photo")%>"></td>
				<td align="center"><%=db.rs.getString("Details")%></td>
				
				<td align="center"><a href="updateInvItems.jsp?u=<%=db.rs.getString("ItemID")%>"><input name="update" style="color: white; background-color: blue;padding:12px 32px ;border: 2px solid blue; border-radius: 3px;"type="button" value="Update"></a></td>
				<td align="center"><form name="deleteItem" method="post" action="deleteInvItem?u=<%=db.rs.getString("ItemID")%>"><input name="delete"style="color: white; padding:12px 32px;background-color: #f44336; border: 2px solid #f44336; border-radius: 5px;"type="submit" value="Delete"> </form></td>




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