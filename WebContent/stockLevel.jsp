<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Level</title>
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
		 <tr><td style="font-size: larger; color: black"><h3 align="center">Stock Level</h3></td></tr>
	</table>
	

		
		<table align="center">
	

	<tr>
			 <td><a href="viewInvItems.jsp"><input name="back"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Inventory"></a></td>
			<td><a href="viewSupList.jsp"><input name="add"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Make PO"></a></td>
		   <td><a href="viewStockDetails.jsp"><input name="add"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="See Stock Details"></a></td>
			<td><a href="addStockItems.jsp"><input name="add"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="Add new Stock Item"></a></td>


	</tr>
			
	
	
	
</table>
	
<hr width="800px" align="center">



	<div style="background-color: transparent; color: black; font-family: 'Calibri'; padding-left: 30px">
	<table border="5" bordercolor="#008CBA" align="center" cellpadding="25px"  style= " color:#008CBA; border-collapse: collapse;font-size: 18px " >





			<tr>
				<th>Item ID</th>
				<th>Item Name</th>
				<th>In Stock</th>
				
				<%
					try {

						connectDb db = new connectDb();
						
							
						String query = "select s.ItemID,i.Name,sum(s.StockAdded) as 'Count' from stock s,inventory i where s.ItemID=i.ItemID group by s.ItemID ";
					

						db.rs = db.st.executeQuery(query);
						
						
						while (db.rs.next()) {
						
				%>
			
			<tr>
				<td align="center"><%=db.rs.getString("ItemID")%></td>
				<td align="center"><%=db.rs.getString("i.Name")%></td>
				<td align="center"><%=db.rs.getString("Count")%></td>
				<td align="center"><a href="addStock.jsp?u=<%=db.rs.getString("ItemID")%>"><input name="stock" style="color: white; background-color: green; border: 2px solid green; border-radius: 5px;"type="button" value="Add New Stock"></a></td>




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