<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stock Item</title>
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
				<td style="font-size: larger; color: black"><h3 align="center">Add a New Stock Item</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="addStockItem" method="post" action="insertDataStockItem">
						<table>
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Item ID</td>
								<td><input type="text"  name="itemid" style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
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
							       <td><input name="addStockItem"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Add Item to Stock"></td>
										
							</tr>
							<tr>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	
	</div>


</body>
</html>