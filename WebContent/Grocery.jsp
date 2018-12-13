<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grocery Items</title>
</head>
<body>


	<%@ include file="Header.jsp"%>

	<table cellspacing="50px" align="center" cellpadding="50px">

		<% 
			try {
				boolean t;
				connectDb db = new connectDb();
				
				String query;
				
			
					query = "select ItemID,Name,UnitPrice,Photo from inventory where Category like 'Grocery'";
					db.rs = db.st.executeQuery(query);
			
				
				for (int r = 0; r < 3; r++) {
		%>
		<tr style="height: 200px">
			<%
				for (int c = 0; c < 4; c++) {
					
							//while (db.rs.next()) {
							t=db.rs.next();
							if(t==false)
								break;
			%>


			<td align="center" style="border: solid; color: white; background-color: #717171; width: 200px">
				
				
				<%=db.rs.getString("Name")%> 
				<img width=200px height=200px src="Resources/<%=db.rs.getString("Photo")%>">
				Rs. <%=db.rs.getString("UnitPrice")%>
				<form name="popup" method="post" action="Item_popup.jsp?u=<%=db.rs.getString("ItemID")%>"><input name="view"style="color: white; background-color: red; border: 2px solid red; border-radius: 5px;"type="submit" value="View"> </form>
				</td>
   <%                
 	}
   
 %></tr> <%
 	}

 	} catch (Exception e) {
 		e.printStackTrace();
 	}
 %>
			
	</table>



</body>
</html>