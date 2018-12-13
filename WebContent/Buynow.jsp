

<html>

<head>
<title>View more</title>

<style>
#popupImage {
	border-color: #008CBA;
	border-style: solid;
	height: 500px;
	width: 400px;
	padding: 10px;
}

#imageTD {
	width: 50%;
	padding-left: 25%;
}

#dataTD {
	width: 50%;
	padding-left: 300px;
}
</style>

</head>

<body>



	<%@include file="Header.jsp"%>
	<%@page import="com.oop.dbconnect.*"%>

<%
 	
try{
	
		String customerID = request.getParameter("CustomerID");
	
		System.out.println(customerID);
		connectDb cn = new connectDb();
		cn.rs = cn.st.executeQuery("select * from orders where CustomerID='"+customerID+"' order by oderTimeDate ");
	//desc is not working
		cn.rs.next();
		
		String name = cn.rs.getString("name");
		String address = cn.rs.getString("address");
		String phone = cn.rs.getString("contactNo");
	
		System.out.println(name);

%>




	<div style="float: left; color: white; margin-left: 200px">

		<table align="center">
			<form method="get" action="updateDiliverDatails">
				<input type="hidden" name="CustomerID" value="<%=request.getParameter("CustomerID")%>">
				
				<caption>
					<h1 style="color: #008CBA; margin-left: -850px">Input your details</h1>
				</caption>
				<tr>
					<td><img src="SlideShowImages/buynow-logo-bk.png" style="border: solid #008CBA"
						height="480" width="480" /></td>
					<td
						style="padding-left: 50px; background-color: #008CBA; width: 500px;; color: white;">
						<h2 align="left">
							Name &emsp;:&emsp;
							<input type="text" id="name" value="<%= name %>" name="name" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></h2>
						<h2 align="left">
							Delivery Address &emsp;&emsp; :&emsp;
							<textarea  id="address" value="" name="address" style="border-radius: 5px; width: 400px; height: 100px; border-style: groove"><%= address %></textarea></h2>
						
						<h2 align="left">
							Contact No &emsp;:&emsp;
							<input type="text" value="<%= phone %>" id="name" name="contactNumber" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></h2>
						
						
						
						<h2 align="left">
							Payment Method &emsp;&emsp;:&emsp;
							<select id="name" name="paymentType" style="border-radius: 5px; width: 400px; height: 25px; border-style: groove">
							<option value="COD">Cash On Delivery</option>
							<option value="Visa">Visa</option>
							<option value="MasterCard">Master Card</option>
							<option value="Ezcash">Ez-Cash</option>
														
							</select></h2>
						
						
			<input type="submit" value="Confirm Order" height="25px"
				style="width: 150px; border: 2px solid black; border-color: #008CBA; color: #008CBA; background-color: white; padding: 14px 28px; font-size: 16px; cursor: pointer; : hover {background-color: #008CBA; color: white">

</form>






			</td>
			</tr>



		</table>
		<% 
		}catch(Exception e){
	
}
		%>
	</div>



	<%@include file="Footer.jsp"%>
</body>



</html>