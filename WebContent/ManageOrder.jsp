<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Orders</title>

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
		 <tr><td style="font-size: larger; color: black"><h3 align="center">Order Data</h3></td></tr>
	</table>
	

		
		<table align="center" style = "padding: 10px">
	

	<tr>
			 <td><a href="ManageOrder.jsp"><input class="btn1" name="back"type="button" value="Show All Items"></a></td>
			<td><form action="ManageOrder.jsp" method="post"><input style=" color:#008CBA; padding:15px 32px ;    margin-right:5px;border: 2px solid #008CBA; border-radius:5px" type="text" name="s1" placeholder="Search Here..."><input class="btn1" name="add" type="submit" value="Search"></form></td>
			<td><a href="viewSupList.jsp"><input class="btn1"  name="add"  type="button" value="View Suppliers"></a></td>
		   
			<td><a href="stockLevel.jsp"><input name="stock"class="btn1" type="button" value="View Stock Level"></a></td>


	</tr>
			
	
	
	
</table>
	
<hr width="1200px" align="center">



	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
	
		<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >





			<tr>
				
				<th>Customer ID</th>
				<th>Item</th>
				<th>Quantity</th>
				<th>Customer Name</th>
				<th>Address</th>
				<th>Order Time</th>
				<th>Prepared EID</th>
				<th>Delivered EID</th>
				<th>Delivered Time</th>
				
			</tr>
				<%
					try {

						connectDb db = new connectDb();
						
						String search=request.getParameter("s1");			
						String query;
						if(search!=null){
							query="select * from orders o, Inventory i where i.Name like'%"+search+"%' ";
						}
						else{

							// query = "select * from orders where preapredEID is not null and diliverEID is not null order by diliver desc";
							 query = "select * from orders o, Inventory i where o.itemID = i.ItemID and preapredEID is not null and diliverEID is not null order by diliver desc";
								
						
						}

						db.rs = db.st.executeQuery(query);

						while (db.rs.next()) {
				%>
			
			<tr>
				<td align="center"><%=db.rs.getString("o.CustomerID")%></td>
				<td align="center"><%=db.rs.getString("i.Name")%></td>
				<td align="center"><%=db.rs.getString("o.qty")%></td>
				<td align="center"><%=db.rs.getString("o.name")%></td>
				<td align="center"><%=db.rs.getString("o.address")%></td>
				<td align="center"><%=db.rs.getString("o.oderTimeDate")%></td>
				<td align="center"><%=db.rs.getString("o.preapredEID")%></td>	
				<td align="center"><%=db.rs.getString("o.diliverEID")%></td>
				<td align="center"><%=db.rs.getString("o.diliver")%></td>
				



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