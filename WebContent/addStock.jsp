<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	   <%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stock</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@ include file="Header.jsp" %>

	<div
		style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Add New Stock</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="addStock" method="post" action="insertDataStock" >
					<% 
					try{
							connectDb db = new connectDb();
							String u=request.getParameter("u");
	
							String query="select * from inventory where ItemID ='"+u+"'";
							db.rs=db.st.executeQuery(query);  
							while(db.rs.next()){ 
	
					%>
						<table>
						
							<tr><td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("ItemID"))%>"></td></tr> 
							<tr>
							 <td style="font-family: Calibri; width: 200px; font-size: large"><b>Item ID</b></td><td><b><%=db.rs.getString("ItemID")%></b></td> 
							</tr>
							<tr>
								<td><br></td>
							</tr>
							
							<tr>
							 <td style="font-family: Calibri; width: 200px; font-size: large"><b>Item Name</b></td><td><b><%=db.rs.getString("Name")%></b></td> 
							</tr>
							
							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Stock Added</td>
								<td><input type="text" name="stockadded" style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>
							
							<tr>
								<td><br></td>
							</tr>
							
							
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Purchase Price</td>
								<td><input type="text" name="purchaseprice" style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>
							
							<tr>
								<td><br></td>
							</tr>
							
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Supplier ID</td>
								<td><input type="text" name="supid" style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>
							
							<tr>
								<td><br></td>
							</tr>
							
							
							<tr>
									<td><a href="stockLevel.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="addSupplier"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Add to Stock"></td>
										
							</tr>
							<tr>
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

