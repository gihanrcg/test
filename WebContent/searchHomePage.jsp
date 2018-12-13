<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search here</title>
</head>
<body>


	<%@ include file="Header.jsp"%>

	<table cellspacing="20px" align="center" cellpadding="30px"
		width="100%">

		<%
			try {
				boolean t;
				connectDb db = new connectDb();

				String query;
				String search = request.getParameter("search");
				if (search != null) {
					query = "select ItemID,Name,UnitPrice,Photo from inventory where Name like'%" + search + "%'";
					db.rs = db.st.executeQuery(query);
				}

				for (int r = 0;r < 10; r++) {
		%>
		<tr style="height: 100px">
			<%
				for (int c = 0; c < 4; c++) {

							t = db.rs.next();
							if (t == false)
								break;
			%>


			<td align="center"
				style="border: solid #008CBA; color: #008CBA; background-color: white; width: 200px;">


				<p align="center" style="font-size: 18px; font-style: oblique;">
					<%=db.rs.getString("Name")%></p> <img width=200px height=200px
				src="Resources/<%=db.rs.getString("Photo")%>">
				<p style="font-size: 24px; color: red">
					Rs.<%=db.rs.getString("UnitPrice")%>.00
				</p>
				<form name="popup" method="post"
					action="Item_popup.jsp?u=<%=db.rs.getString("ItemID")%>">
					<input name="view"
						style="background-color: #008CBA; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 10px 10px; cursor: pointer;"
						type="submit" value="View more">
				</form>
			</td>
			<%	
				}
			%>
		</tr>
		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>



</body>
</html>