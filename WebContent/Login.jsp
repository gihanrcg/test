<!DOCTYPE html>

<html>

<head>
	<title> Login</title>
	
	<style>
	input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 15px;
    margin: 0px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
	
	</style>
	
</head>

<body>

	<%@include file = "Header.jsp" %>
	
	<div style="float: left; background-color: white-space;width: 50%; height: 400px;">
	<b>
	<p style="margin-left: 30px;width: 80%;font: bold; color: #008CBA">
	<br><br><br>
	New Customers, <br>
By creating an account with our store, <br>
you will be able to move through the checkout process 
faster, store multiple shipping addresses, view and 
track your orders in your account and more.
	</p>
	</b>
	</div>


	<div style="float: right; background-color:#008CBA;width: 50%; height: 400px;color: white;">
		
	<form method="post" action="loginPage">
	
		<p style="padding-left: 30px; "><b> Username or Email</b></p>
		<input type = "text" name = "username" placeholder="User Name" style="width: 80%;heigth :30px ;margin-left: 30px;">

		<p style="padding-left: 30px;"><b> Password</b></p>
		<input type = "password" name = "password" placeholder="Password" style="width: 80%;heigth :30px ;margin-left: 30px;">	
		<br><br>
		<input type="checkbox" name = "remember" checked="checked" style="margin-left: 30px">Remember me	
	    <br><br>
		<input type =  "submit" value = "Login" style = "margin-left:30px;width:150px; border: 2px solid black;border-color: #008CBA; color: #008CBA; background-color: white;padding: 14px 28px;font-size: 16px;cursor: pointer;:hover{background-color: #008CBA; color:white} "  >
		
		<a href = "Home.jsp"><input type =  "button" value = "Cancel"  style = "margin-left:30px;width:150px; border: 2px solid black;border-color: #008CBA; color: #008CBA; background-color: white;padding: 14px 28px;font-size: 16px;cursor: pointer;:hover{background-color: #008CBA; color:white} "  > </a>
	
	</form>
	
	</div>



	<%@include file = "Footer.jsp" %>

</body>

</html>
