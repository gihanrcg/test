<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items in your cart</title>
</head>
<body>

	<%@ include file="Header.jsp"%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

		if (session.getAttribute("username") == null) {
			response.sendRedirect("Login.jsp");
		}
		else{
		String uname = session.getAttribute("username").toString();

		try {
			connectDb db = new connectDb();
			String query;

			query = "select * from inventory i,customer_details c,cart ca where c.UserName=ca.CustomerName and ca.ItemID=i.ItemID and c.UserName ='"
					+ uname + "'";
			db.rs = db.st.executeQuery(query);
	%>
	<table align="center">
		<tr>
			<td style="font-size: larger; color: black"><h3 align="center">Items
					In Your Cart</h3></td>
		</tr>
	</table>



	<%
		while (db.rs.next()) {

			%>
	<%
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
	
	
	<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >





			<tr>
				<th>Item Name</th>
				<th>Item Image</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>
			
				
				<%
					try {

						connectDb db = new connectDb();
						String query;
						float T = 0 ;

						query = "select i.ItemID,ca.itemID,i.Name,i.Photo,i.UnitPrice,sum(ca.quantity) as quantity  from inventory i,customer_details c,cart ca where c.UserName=ca.CustomerName and ca.ItemID=i.ItemID and c.UserName ='"
								+ uname + "' group by ca.itemID,i.Name,i.Photo,i.UnitPrice,i.ItemID";
						db.rs = db.st.executeQuery(query);

						while (db.rs.next()) {
				%>
			
			<tr><form action="updateCartItems" method="post">
				<td align="center"><%=db.rs.getString("i.Name")%></td>
				<td align="center"><img width=100px height=100px src="Resources/<%=db.rs.getString("i.Photo")%>"></td>
				<td align="center">Rs.<%=db.rs.getString("i.UnitPrice")%>.00</td>
				<td align="center"><input style="width: 20px" type="text" id="qty" name="qty" value="<%=db.rs.getString("quantity")%>"></td>
				<td> Rs.<% float z = 0;
							int x = Integer.parseInt( db.rs.getString("quantity"));
							float y =Float.parseFloat( db.rs.getString("i.UnitPrice")); 
							z = x * y;
							out.print(z);
							T += z;
							%>0</td>
				<td align="center">
				<input name = "itemName" type="hidden" value = <%= db.rs.getString("i.ItemID") %>> 
				<input name="updateqty"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Update quantity"></form></td>
				
						<td align="right"><form name="deleteCartItem" method="post"
				action="deleteCartItem?u=<%=db.rs.getString("i.ItemID")%>">
				<input name="delete"
					style="color: white; background-color: red; border: 2px solid red; border-radius: 5px;"
					type="submit" value="Delete Item From Cart">
			</form></td>
			
			<td align="right">
			<form name="buynow" method="post" action="Buynow">
				<input type="hidden" name ="uname" value = "<%=uname %>">
				<input type="hidden" name ="itemID" value = "<%=db.rs.getString("i.ItemID")%>">
				<input type="hidden" name ="qty" value = "<%=db.rs.getString("quantity")%>">
				<input type="hidden" name ="unitPrice" value = "<%=db.rs.getString("i.UnitPrice")%>">
				<input type="hidden" name ="itemName" value = "<%=db.rs.getString("i.Name")%>">
				
				
				<input name="buy" style="color: white; background-color: red; border: 2px solid red; border-radius: 5px;"
					type="submit" value="Buy Now">
			</form></td>



			</tr>
				
			<%
				}
						%> 
						<tr><td></td><td></td> <td></td> <td></td> <td>Rs. <%=T%>0</td><td></td><td></td><td></td>
			</tr>
						
						
						<% 
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
			%>

		
			
		</table>
	
</body>
</html>