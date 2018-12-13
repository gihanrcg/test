<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>

<style>
body {
    font-family: "Lato", sans-serif;
}
.closebtn{

color:#008CBA;

}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0px;
    left: 0px;
    background-color: #008CBA;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: white;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: blue	;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>

</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if((session.getAttribute("username")==null) ||(!session.getAttribute("username").equals("admin") )){
		response.sendRedirect("Login.jsp");
	}
	



%>
<form method="post" action="logoutPage">
		<table align="right">
			<tr>
				<td>Logged In: ${username}</td><td><input type="submit" value="Logout"></td>
			</tr>

		</table>
	</form>




<h2 style = "color:#008CBA" >Admin Panel</h2>
<p  style = "color:#008CBA;" ><b>Please be aware that any change you do here can affect the Website</b></p>
<span style="font-size:30px;cursor:pointer; color:#008CBA" onclick="openNav()">&#9776; Open Panel</span>

<div id="mySidenav" class="sidenav">



  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="viewInvItems.jsp">Manage Products</a>
  <a href="viewCustomerdetails.jsp">Manage Customers</a> 
  <a href="prepareOrder.jsp">View Un-prepared Orders</a>
  <a href="deliverOrder.jsp">View Un-delivered Orders</a>
  <a href="ManageOrder.jsp">View Completed Orders</a>
  <a href="SalesReport.jsp">Non-parameterized Report</a>
   <a href="parameterizedSalesReport.jsp">Parameterized Report</a>
  <a href="Home.jsp">Visit Home Page</a>
  <p style = "color : white; font-size:16px;padding-left:20px">
  
  Customers Online : <br>
  No of Customers :	<br>
  No of Products : <br>
  
  </p>
  
  
  
</div>



</body>
</html>