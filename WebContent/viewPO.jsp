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
				<th>Supplier ID</th>
				<th>Item Ordered</th>
				<th>Stock Ordered</th>
				<th>Details</th>
				<th>Order Date And Time</th>
				
				<%
					try {

						connectDb db = new connectDb();

						String sql = "select * from purchaseorder";

						db.rs = db.st.executeQuery(sql);

						while (db.rs.next()) {
				%>
			
			<tr>
				<td align="center"><%=db.rs.getString("OrderID")%></td>
				<td align="center"><%=db.rs.getString("SupplierID")%></td>
				<td align="center"><%=db.rs.getString("ItemOrdered")%></td>
				<td align="center"><%=db.rs.getString("StockOrdered")%></td>
				<td align="center"><%=db.rs.getString("Details")%></td>
				<td align="center"><%=db.rs.getString("OrderDate")%></td>
			




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


	
	

	<p align="center"><a href="viewSupList.jsp"><input name="back"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></p>
			
			


	
			
	
	
	

		

</body>
</html>