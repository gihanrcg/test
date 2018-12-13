<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Supplier</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@ include file="Header.jsp" %>



<div style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Update Supplier Details</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="updateSupplier" method="post" action="updateDataSup">
				<%
try{
	connectDb db = new connectDb();
	String u=request.getParameter("u");
	
	
	
	String query="select * from supplier where SupplierID='"+u+"'";

	db.rs=db.st.executeQuery(query);  
	
	while(db.rs.next()){ 

%>
					
						<table>
						 <tr><td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("SupplierID"))%>"></td></tr> 
							
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Supplier Name</td>
								<td><input type="text" id="sname" name="sname" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove" value="<%=db.rs.getString("SName")%>" ></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Supplier Address</td>
								<td><input type="text" id="saddress" name="saddress" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove" value="<%=db.rs.getString("SAddress")%>"></td>
							</tr>
							


							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Supplier Contact No</td>
								<td><input type="text" id="scontactno" name="scontactno" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove" value="<%=db.rs.getString("SContact")%>"></td>
							</tr>

							



							<tr>
								<td><br></td>
							</tr>
							
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Supplier Contact Email</td>
								<td><input type="text" id="semail" name="semail" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove" value="<%=db.rs.getString("SEmail")%>"></td>
							</tr>
							
							

							<tr>
								<td><br></td>
							</tr>

							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							

							<tr>
								
									<td><a href="viewSupList.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="update"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Update"></td>
										
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
 

