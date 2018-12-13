<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make PO</title>
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
				<td style="font-size: larger; color: black"><h3 align="center">Make Purchase Order</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="makePO" method="post" action="makePurchaseOrder">
					
	<%				
	try{
	connectDb db = new connectDb();
	String u=request.getParameter("u");
	
	
	
	String query="select * from supplier where SupplierID='"+u+"'";
	
	db.rs=db.st.executeQuery(query);  
	
	while(db.rs.next()){ 
					
	%>			
					
					
						<table>
						<tr><td><b>Supplier Name</b></td><td><b><%=db.rs.getString("SName")%></b></td></tr> 
						 
						 
						 
						 <tr>
						
						
						 <tr><td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("SupplierID"))%>"></td></tr> 
						 
						 
						 
						 <tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Item Ordered</td>
								<td><input type="text" id="orderitem" name="orderitem" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
						 
						 
						 
						 <tr>
								<td><br></td>
							</tr>
							
						 
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Order Quantity</td>
								<td><input type="text" id="orderqty" name="orderqty" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							
							
							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Details</td>
								<td><input type="text" id="details" name="details" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>


									
							<tr>
								<td><br></td>
							</tr>

						
							<tr>
									<td><a href="viewSupList.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="order"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Order"></td>
										
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