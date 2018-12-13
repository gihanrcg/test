<%@page import="com.oop.dbconnect.connectDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%  
	try{
	connectDb db = new connectDb();

	for(int i = 171; i < 342; i++){
		
		int unitprice;
		
		db.rs = db.st.executeQuery("SELECT UnitPrice from inventory where ItemID = '"+i+"'");
		while(db.rs.next()){
		unitprice = Integer.parseInt(db.rs.getString("UnitPrice"));
		
		db.st.executeUpdate("INSERT INTO stock(ItemID,StockAdded,PurchasePrice,SupplierID,Date,StartQTY)VALUES('"+i+"',20,'"+(unitprice - 20)+"',1,CURRENT_DATE,20)");
		}
	}

	}catch(Exception e){
		e.printStackTrace();
	}














%>


</body>
</html>