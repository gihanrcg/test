<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Purchase Orders</title>
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
					
					<td style="font-size: larger; color: black"><h3 align="center">Purchase Orders Made</h3></td>
			
			</tr>			
			
	</table>
	
	
		
	
<hr width="800px" align="center">
	
	
	

	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
	
	<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >




			<tr>
				<th>Order ID</th>
				<th>CustomerID</th>
				<th>ItemID</th>
				<th>qty</th>
				<th>unitSellPrice</th>
				<th>unitPurchaseprice</th>
				<th>reciver name</th>
				<th>Address</th>
				<th>Payment Type</th>
				<th>Order Time</th>
				
				<th>Prepared EID</th>
				
				
				
				<%
					try {

						connectDb db = new connectDb();

						String sql = "select * from orders where preapredEID is null";

						db.rs = db.st.executeQuery(sql);

						while (db.rs.next()) {
				%>
			
			<tr>
				<form action="preparedOrder">
				<td align="center"><%=db.rs.getString("OrderID")%></td>
				<td align="center"><%=db.rs.getString("CustomerID")%></td>
				<td align="center"><%=db.rs.getString("ItemID")%></td>
				<td align="center"><%=db.rs.getString("qty")%></td>
				<td align="center"><%=db.rs.getString("unitSellPrice")%></td>
				<td align="center"><%=db.rs.getString("unitPurchaseprice")%></td>
				<td align="center"><%=db.rs.getString("name")%></td>
				<td align="center"><%=db.rs.getString("address")%></td>
				<td align="center"><%=db.rs.getString("paymentType")%></td>
					<td align="center"><%=db.rs.getString("oderTimeDate")%></td>
					
					<td> <input type="text" name="preparedEID"></td>
					
					<input type="hidden" name="OrderID" value="<%=db.rs.getString("OrderID")%>">
					<td><input type="submit"></td>

					

			</tr>
			</form>

			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>




		</table>
		
	</div>
	
	
	<hr width="800px" align="center">


	
	

	<p align="center"><a href="AdminPanel.jsp"><input name="back"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></p>
			
			


	
			
	
	
	

		

</body>
</html>